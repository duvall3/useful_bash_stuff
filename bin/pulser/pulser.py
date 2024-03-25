"""
PULSE GENERATOR CODE (PYTHON3) - pulse.py

  This code is equivalent to Mark's pulse generator
  code but this version is written and run in python3.

  Jeffrey Gabriel Yepez
  Dated: 19 March 2024

  Minor modifications by Mark J. Duvall
  Dated: 22 March 2024
"""

import pyaudio
import time
import numpy as np
import matplotlib.pyplot as plt
import wavio

########################################################
# INITIALIZATION

PLOT_SIGNAL = True
SAVE_SIGNAL = False
PLAY_SIGNAL = True

SAVE_WAV_FILE = True

PLOT_SPECTRUM = True
SAVE_SPECTRUM = False

fs = 44100  # Sampling rate (Hz)

n_pulses = 1000
pulse_dur = 0.001
duration = n_pulses * pulse_dur  # In seconds

a = 0.25 # Amplitude in range [0.0, 1.0]

N = int(duration * fs) # Number of samples

########################################################
# STEP 1: TIME SIGNAL

tstep = 1 / fs
t = np.linspace(0, (N - 1) * tstep, N)

# Generate samples for gaussian pulse.
mu0 = 0.5 # Position of first gaussian pulse in time domain
sigma = 0.0001 # Spread of gaussian
y = 0 # Initialize waveform variable
for n in range(n_pulses):
    # Note that the pulse train is created by changing mu and adding the signal spaces together, where "mu = duration * (n + l) / n_pulses" and n is the iterator.
    y += a * np.exp(-((t - (duration * (n + mu0) / n_pulses)) / sigma) ** 2).astype(np.float32)
    
########################################################
# STEP 2: AMPLITUDE SPECTRUM

fstep = fs / N
f = np.linspace(0, (N - 1) * fstep, N)

# Compute the Fourier transform with the DC component (i.e., signal mean) removed
# Note: We do not subtract the mean from the signal itself
#   (e.g., by executing 'y=y-np.mean(y)' because we want
#   to keep the signal polarity uniform. Pulses that are exclusively
#   positive or negative are more useful in lab settings.
Y = np.abs(np.fft.fft(y-np.mean(y))) / N
# Normalize:
Y = Y / np.max(Y)

f_plot = f[0:int(N/2 + 1)]
Y_plot = Y[0:int(N/2 + 1)]

########################################################
# STEP 3: PLOTTING

# plot up to 10 pulses
N_pulse = np.floor(pulse_dur * fs)
N_plot = int(np.minimum(10, n_pulses) * N_pulse)
plt.plot(t[0:N_plot], y[0:N_plot])
plt.xlabel("Time (s)")
plt.title("Pulse Signal")
if SAVE_SIGNAL:
    plt.savefig("signal.pdf")
if PLOT_SIGNAL:
    plt.show()
else:
    plt.close()

pulse_freq = 1.e-3 / pulse_dur
plt.plot(f_plot/1000, Y_plot, linewidth=2)
plt.xlim(0, np.minimum(22.050, 7.5*pulse_freq))
plt.grid()
plt.xlabel("Frequency (kHz)")
plt.ylabel("Normalized Relative Amplitude")
plt.title("Spectrum")
if SAVE_SPECTRUM:
    plt.savefig("spectrum.pdf")
if PLOT_SPECTRUM:
    plt.show()
else:
    plt.close()

########################################################
# STEP 4: SIGNAL OUTPUT

if PLAY_SIGNAL:
    p = pyaudio.PyAudio()

    # Convert signal to bytes to play signal.
    output_bytes = (y).tobytes()

    # For paFloat32 sample values must be in range [-1.0, 1.0].
    stream = p.open(format=pyaudio.paFloat32,
                channels=1,
                rate=fs,
                output=True)
                
    # Plays waveform. May repeat with different volume values.
    start_time = time.time()
    stream.write(output_bytes)
    print("Played sound for {:.4f} seconds".format(time.time() - start_time))

    stream.stop_stream()
    stream.close()

########################################################
# STEP 5: SAVE SIGNAL

if SAVE_WAV_FILE:
    print('Saving .wav output...')
    # Ensure that highest value is in 16-bit range
    audio = y * (2**15 - 1) / np.max(np.abs(y))
    # Convert to 16-bit data
    audio = audio.astype(np.int16)
    # write out signal
    wavio.write('signal.wav', y, fs, sampwidth=2)
    print('Done.')

########################################################
# All pau!   )

print("Finished. Exiting...")
# exit()

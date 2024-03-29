"""
PULSE GENERATOR CODE (PYTHON3) - pulse.py

  This code is equivalent to Mark's pulse generator
  code but this version is written and run in python3.

  Jeffrey Gabriel Yepez
  Dated: 19 March 2024

  Minor modifications by Mark J. Duvall
  Dated: 22 March 2024
"""


########################################################
# IMPORTS

# import pyaudio
# import time
# import numpy as np
# import matplotlib.pyplot as plt
# import wavio

import sys
from importlib import import_module
MODULE_LIST_plain = ['pyaudio', 'time', 'wavio']
for modname in MODULE_LIST_plain:
    try:
        mod = import_module(modname)
    except:
        # print(sys.exc_info())
        raise ModuleNotFoundError(name = modname, msg = f'Module {modname} not found.')
    else:
        globals()[modname] = mod
MODULE_LIST_abbr = [('numpy', 'np'), ('matplotlib.pyplot', 'plt')]
for (modname, modabbr) in MODULE_LIST_abbr:
    try:
        mod = import_module(modname)
    except:
        # print(sys.exc_info())
        raise ModuleNotFoundError(name = modname, msg = f'Module {modname} not found.')
    else:
        globals()[modabbr] = mod

class pulser:

    ########################################################
    # INITIALIZATION

    # Settings
    def __init__(self, 
        PLAY_SIGNAL = True, 
        PLOT_SIGNAL = True, 
        PLOT_SPECTRUM = True, 
        SAVE_WAV_FILE = True, 
        SAVE_SIGNAL = False, 
        SAVE_SPECTRUM = False,
        fs = 44100,                                     # Sampling rate (Hz)
        n_pulses = 1000,                                # Total number of pulses desired
        pulse_dur =   0.0010,                           # Single-pulse duration in seconds
        pulse_width = 0.0001,                           # Width (stdev) of Gaussian pulses
        vol = 0.5):                                     # Audio volume in range [0.0, 1.0]
            # Options
            self.OPTIONS = {'PLAY_SIGNAL': PLAY_SIGNAL,
                'PLAY_SIGNAL': PLAY_SIGNAL,
                'PLOT_SIGNAL': PLOT_SIGNAL,
                'PLOT_SPECTRUM': PLOT_SPECTRUM,
                'SAVE_WAV_FILE': SAVE_WAV_FILE,
                'SAVE_SIGNAL': SAVE_SIGNAL,
                'SAVE_SPECTRUM': SAVE_SPECTRUM}
            # Input Parameters
            self.PARAMETERS = {'fs': fs,
                'n_pulses': n_pulses,
                'pulse_dur': pulse_dur,
                'pulse_width': pulse_width,
                'vol': vol}
            # Derived parameters
            DUR = self.PARAMETERS['n_pulses'] * self.PARAMETERS['pulse_dur']      # Total signal duration in seconds
            self.DERIVED = {'duration': DUR,
                'N': int(DUR * self.PARAMETERS['fs']),                            # Total number of samples in signal
                'a': self.PARAMETERS['vol']**2}                                   # Pulse amplitude

    def __update_derived__(self):
        """
        Update the derived parameters.
        """
        self.DERIVED['duration'] = self.PARAMETERS['n_pulses'] * self.PARAMETERS['pulse_dur']            # Total signal duration in seconds
        self.DERIVED['N'] = int(self.DERIVED['duration'] * self.PARAMETERS['fs'])                        # Total number of samples in signal
        self.DERIVED['a'] = self.PARAMETERS['vol']**2                                                    # Pulse amplitude

    # for printing
    def __str__(self):
        s = f'\nPULSER ATTRIBUTES:\n\n'
        s += f'Options:\n'
        for key in self.OPTIONS.keys():
            s += f'{key}\t\t{self.OPTIONS[key]}\n'
        s += f'\n'
        s += f'Input Parameters:\n'
        for key in self.PARAMETERS.keys():
            s += f'{key}\t\t{self.PARAMETERS[key]}\n'
        s += f'\n'
        s += f'Derived Parameters:\n'
        for key in self.DERIVED.keys():
            s += f'{key}\t\t{self.DERIVED[key]}\n'
        if 'signal' in dir(self):
            s += f'\nSignal:\n' + self.signal.__str__() + f'\n'
        else:
            s += f'\nRun the generate() method to create the signal.\n'
        return s

    ########################################################
    # STEP 1: PULSE TRAIN

    def generate(self):
        """
        Generate the pulse train according to the current settings.
        """
        tstep = 1 / self.PARAMETERS['fs']
        t = np.linspace(0, (self.DERIVED['N'] - 1) * tstep, self.DERIVED['N'])
        # Generate samples for gaussian pulse.
        mu0 = 0.5 # Position of first gaussian pulse in time domain
        sigma = self.PARAMETERS['pulse_width'] # Spread of gaussian
        y = 0 # Initialize waveform variable
        for n in range(self.PARAMETERS['n_pulses']):
            # Note that the pulse train is created by changing mu and adding the signal spaces together, where "mu = duration * (n + l) / n_pulses" and n is the iterator.
            y += self.DERIVED['a'] * np.exp(-((t - (self.DERIVED['duration'] * (n + mu0) / self.PARAMETERS['n_pulses'])) / sigma) ** 2).astype(np.float32)
        self.signal = y
       


#########################################################
## STEP 2: AMPLITUDE SPECTRUM

#fstep = fs / N
#f = np.linspace(0, (N - 1) * fstep, N)

## Compute the Fourier transform with the DC component (i.e., signal mean) removed
## Note: We do not subtract the mean from the signal itself
##   (e.g., by executing 'y=y-np.mean(y)' because we want
##   to keep the signal polarity uniform. Pulses that are exclusively
##   positive or negative are more useful in lab settings.
#Y = np.abs(np.fft.fft(y-np.mean(y))) / N
## Normalize:
#Y = Y / np.max(Y)

#f_plot = f[0:int(N/2 + 1)]
#Y_plot = Y[0:int(N/2 + 1)]

#########################################################
## STEP 3: PLOTTING

## plot up to 10 pulses
#N_pulse = np.floor(pulse_dur * fs)
#N_plot = int(np.minimum(10, n_pulses) * N_pulse)
#plt.plot(t[0:N_plot], y[0:N_plot])
#plt.xlabel("Time (s)")
#plt.title("Pulse Signal")
#if SAVE_SIGNAL:
#    plt.savefig("signal.pdf")
#if PLOT_SIGNAL:
#    plt.show()
#else:
#    plt.close()

#pulse_freq = 1.e-3 / pulse_dur
#plt.plot(f_plot/1000, Y_plot, linewidth=2)
#plt.xlim(0, np.minimum(22.050, 7.5*pulse_freq))
#plt.grid()
#plt.xlabel("Frequency (kHz)")
#plt.ylabel("Normalized Relative Amplitude")
#plt.title("Spectrum")
#if SAVE_SPECTRUM:
#    plt.savefig("spectrum.pdf")
#if PLOT_SPECTRUM:
#    plt.show()
#else:
#    plt.close()

#########################################################
## STEP 4: SIGNAL OUTPUT

#if PLAY_SIGNAL:
#    p = pyaudio.PyAudio()

#    # Convert signal to bytes to play signal.
#    output_bytes = (y).tobytes()

#    # For paFloat32 sample values must be in range [-1.0, 1.0].
#    stream = p.open(format=pyaudio.paFloat32,
#                channels=1,
#                rate=fs,
#                output=True)
                
#    # Plays waveform. May repeat with different volume values.
#    start_time = time.time()
#    stream.write(output_bytes)
#    print("Played sound for {:.4f} seconds".format(time.time() - start_time))

#    stream.stop_stream()
#    stream.close()

#########################################################
## STEP 5: SAVE SIGNAL

#if SAVE_WAV_FILE:
#    print('Saving .wav output...')
#    # Ensure that highest value is in 16-bit range
#    audio = y * (2**15 - 1) / np.max(np.abs(y))
#    # Convert to 16-bit data
#    audio = audio.astype(np.int16)
#    # write out signal
#    wavio.write('signal.wav', y, fs, sampwidth=2)
#    print('Done.')

########################################################
# All pau!   )

# print("Finished. Exiting...")
# exit()

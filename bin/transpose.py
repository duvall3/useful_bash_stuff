'''
transpose.py -- Simple script to use PANDAS
  to transpose the rows and columns of a file.
  Defaults are set for a whitespace-separated table,
  but CSV files can be processed
  by setting DELIMITER to ','.
Usage: python3 <FILENAME> [DELIMITER]
'''
# Note on CSV reader engines:
# delim = ',' --> engine = 'c' (default)
# delim = '\s+' --> engine = 'python'

# init
import sys, os, os.path
try:
    # import pandas as pd
    import pandas as pd
except ModuleNotFoundError as err:
    print(f'Encountered error "{err}".\nThis script requires the PANDAS module. Please run the following command at your shell prompt:\n`pip3 install pandas`')

# process args
narg = len(sys.argv)
if narg < 2:
    raise OSError('Input filename argument required.')
infile = sys.argv[1]
basename, extension = os.path.splitext(infile)
outfile = basename + '_transpose' + extension
if narg > 2:
    insep = sys.argv[2]
else:
    if extension == '.csv':
        insep = ','
    else:
        insep = '\s+'
if insep == ',':
    eng = 'c'
    outsep = insep
else:
    eng = 'python'
    outsep = '\t'
print(infile, f'"{insep}"', eng, outfile, f'"{outsep}"') #debug

# read input file
df = pd.read_csv(infile, engine=eng, sep=insep)

# write transposed output file
df.T.to_csv(outfile, sep=outsep, header=None)

# all pau!   )

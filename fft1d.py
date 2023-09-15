import pyfftw
import numpy
import math
import sys
import re

filename = ""

###############################################################################

def count_file_line(fname):
  
  with open(fname) as f:
    for i, l in enumerate(f):
      pass

  return i + 1

###############################################################################

if (len(sys.argv)) == 2:
  filename = sys.argv[1]
else:
  print "usage :", sys.argv[0] , " check_prediction.txt"
  exit(1)

inputf = open(filename, "r")

numofl = count_file_line(filename)

data = pyfftw.n_byte_align_empty(numofl, 16, 'float64')

i = 0
for l in inputf:
  p = re.compile(r'\s+')
  line = p.sub(' ', l)
  line = line.lstrip()
  line = line.rstrip()
          
  plist = line.split(" ")
  data[i] = float(plist[1])
  i = i + 1

inputf.close()

"""
## (exponential damping)
if preprocess_damp
  damp = exp ( -(t-t(1)) / preprocess_expconst);
  f = f .* damp;
endif

## (zero padding)
if preprocess_pad
   zeros = linspace (0.0, 0.0, preprocess_npad);
   f = vertcat (f, zeros(:));
endif
"""

b = pyfftw.interfaces.numpy_fft.fft(data)

# per un segnale reale, se non ricordo male solo i primi N/2 
# sono significativi da cobtrollare
i = 0
for d in b:
  if i <= len(b)/2:
    print i, " ", d.real, " ", d.imag, " ", math.sqrt(d.real**2+d.imag**2)
  i = i + 1

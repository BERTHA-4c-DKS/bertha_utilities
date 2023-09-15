import re
import sys
import math

def file_len(fname):
    with open(fname) as f:
        for i, l in enumerate(f):
            pass
    
    return i + 1

filename1 = "oneel.txt.old.cols"
filename2 = "oneel.txt"

if (len(sys.argv)) == 3:
    filename1 = sys.argv[1]
    filename2 = sys.argv[2]
else:
    print("usage: ", sys.argv[0], " file1 file2 ")
    exit(1)

f1 = open(filename1, "r")
f2 = open(filename2, "r")

dim1 = file_len(filename1)
dim2 = file_len(filename2)

if dim1 == dim2:
  
  maxdiff = 0.0

  for l1 in f1:
    l2 = f2.readline()
    if l1 != l2:
      p = re.compile(r'\s+')

      line1 = p.sub(' ', l1)
      line1 = line1.lstrip()
      line1 = line1.rstrip()
      plist1 = line1.split(" ")
      i1 = int(plist1[0])
      j1 = int(plist1[1])
      real1 = float(plist1[2])
      img1 = float(plist1[3])

      line2 = p.sub(' ', l2)
      line2 = line2.lstrip()
      line2 = line2.rstrip()
      plist2 = line2.split(" ")
      i2 = int(plist2[0])
      j2 = int(plist2[1])
      real2 = float(plist2[2])
      img2 = float(plist2[3])

      if i1 == i2  and j1 == j2:
          if maxdiff < math.fabs(real2 - real1):
              maxdiff = math.fabs(real2 - real1)
          if maxdiff < math.fabs(img2 - img1):
              maxdiff = math.fabs(img2 - img1)

          print(math.fabs(real2 - real1), " ", math.fabs(img2 - img1)) 
      else:
          print ("Two files are different")
          exit(1)

  print("MaxDiff: ", maxdiff)
else:
  print ("Two files are different")

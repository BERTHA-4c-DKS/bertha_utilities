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

dim1 = file_len(filename1)
dim2 = file_len(filename2)

f1 = open(filename1, "r")
f2 = open(filename2, "r")

if dim1 == dim2:

  maxdiff = 0.0
  maxdiffeig = 0.0
  p = re.compile(r'\s+')

  line = f1.readline()
  line = p.sub(' ', line)
  line = line.lstrip()
  line = line.rstrip()
  pline = line.split(" ")

  numof1 = int(pline[1])
  dim1 = int(pline[0])

  line = f2.readline()
  line = p.sub(' ', line)
  line = line.lstrip()
  line = line.rstrip()
  pline = line.split(" ")

  numof2 = int(pline[1])
  dim2 = int(pline[0])

  if dim1 == dim2 and numof2 == numof1 :
      for i in range(dim1):
          line1 = f1.readline()
          line2 = f2.readline()

          eig1 = float(line1)
          eig2 = float(line2)

          if math.fabs(eig1 - eig2) > maxdiffeig:
              maxdiffeig = math.fabs(eig1 - eig2)

          if math.fabs(eig1 - eig2) != 0.0:
              print(math.fabs(eig1 - eig2))

          for j in range(numof1):
              line1 = f1.readline()

              line1 = p.sub(' ', line1)
              line1 = line1.lstrip()
              line1 = line1.rstrip()
              pline1 = line1.split(" ")

              real1 = float(pline1[0])
              img1 = float(pline1[1])

              line2 = f2.readline()

              line2 = p.sub(' ', line2)
              line2 = line2.lstrip()
              line2 = line2.rstrip()
              pline2 = line2.split(" ")

              real2 = float(pline2[0])
              img2 = float(pline2[1])

              if maxdiff < math.fabs(real2 - real1):
                  maxdiff = math.fabs(real2 - real1)
              if maxdiff < math.fabs(img2 - img1):
                  maxdiff = math.fabs(img2 - img1)

              if math.fabs(real2 - real1) != 0.0 or math.fabs(img2 - img1) != 0.0:
                print(math.fabs(real2 - real1), " ", math.fabs(img2 - img1)) 

  else:
      print ("Two files are different")
      exit(1)

  print("MaxDiff: ", maxdiff)
  print("MaxDiff Eigenvalue: ", maxdiffeig)
else:
  print ("Two files are different")

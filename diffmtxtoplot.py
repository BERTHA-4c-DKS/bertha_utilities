import re
import sys

filename1 = "oneel.txt.old.cols"
filename2 = "oneel.txt"

if (len(sys.argv)) == 3:
  filename1 = sys.argv[1]
  filename2 = sys.argv[2]

f1 = open(filename1, "r")
f2 = open(filename2, "r")


dim1 = int(f1.readline())
dim2 = int(f2.readline())

if dim1 == dim2:
  for l1 in f1:
    l2 = f2.readline()
    if l1 != l2:
      p = re.compile(r'\s+')

      line1 = p.sub(' ', l1)
      line1 = line1.lstrip()
      line1 = line1.rstrip()
      plist1 = line1.split(" ")
      img1 = float(plist1[2])
      real1 = float(plist1[3])

      line2 = p.sub(' ', l2)
      line2 = line2.lstrip()
      line2 = line2.rstrip()
      plist2 = line2.split(" ")
      img2 = float(plist2[2])
      real2 = float(plist2[3])

      print plist1[0], plist1[1], 1.0, real1, img1, real2, img2
else:
  print "Two files are different"

import sys

filename = ""

if (len(sys.argv)) == 2:
    filename = sys.argv[1]
else:
    print "usage: ", sys.argv[0] , " filename "
    exit (1)

fp = open(filename)

previousline = ""

lines = []
counter = 0
for l in fp:
    counter = counter + 1
    lines.append(l.rstrip()) 

fp.close()

for i in range(1, counter):
    l = lines[i]
    l1 = lines[i-1]

    if len(l) > 6:
        if l[4] == ' ' and l[5] != ' ' and l[6] == ' ':
          lines[i-1] = l1.rstrip() + " &"
          lines[i] = l[:5] + " " + l[6:]

    if len(l) > 1:
        if l[0] == 'c':
            lines[i] = "!" + l[2:]

for l in lines:
    print l

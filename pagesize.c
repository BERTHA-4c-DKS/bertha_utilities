#include <stdio.h>
#include <unistd.h> 
 
int main (int argc, char ** argv) 
{
  fprintf(stdout, "Page size %ld bytes.\n",
           sysconf(_SC_PAGESIZE));
 
  return 0;
}


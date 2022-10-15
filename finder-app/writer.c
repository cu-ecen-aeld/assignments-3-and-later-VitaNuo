#include <stdio.h>
#include <errno.h>
#include <syslog.h>

int main(int argc, char* argv[]) {
 openlog("writerlog", LOG_PID, LOG_USER);

 if (argc < 3) {
  syslog(LOG_ERR, "Less than two arguments specified.\n");
  return 1;
 }

 char* writefile = argv[1];
 char* writestr = argv[2];

 FILE* file = fopen(writefile, "w");
 if (file == NULL) {
  char msg[256];
  sprintf(msg, "Could not open file: error %d", errno);
  syslog(LOG_ERR, msg);
 }

 char msg[256];
 sprintf(msg, "Writing %s to %s.", writestr, writefile);
 syslog(LOG_DEBUG, msg);
 fprintf(file, "%s", writestr);
 return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

int execute(char** command) {
	pid_t chP = fork();
	int status = 0;
	if(chP == 0) {
		int c = execvp(command[0], command);
		exit(errno);
	}
	else {
		wait(&status);
	}
	return WEXITSTATUS(status);
}

int main(int argc, char *argv[]) {
	char* add[3] = {"git", "add", "*"};
	char* commit[5] = {"git", "commit", "-a", "-m", "\"Update\""};
	char* push[2] = {"git", "push"};
	if(argc > 1) {
		int n = 1;
		while(n < argc) {
			if(!strcmp(argv[n], "-a")) {
				execute(add);
			}
			else if(!strcmp(argv[n], "-m")) {
				char* commit[5] = {"git", "commit", "-a", "-m", argv[++n]};
			}
			else if(!strcmp(argv[n], "-f")) {
				char* push[3] = {"git", "push", "-f"};
			}
			else {
				printf("Incorrect command\n");
				return -1;
			}
		}
	}
	execute(commit);
	execute(push);
	return 0;
}

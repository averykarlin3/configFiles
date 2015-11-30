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
	char* add[] = {"git", "add", "*"};
	char* commit[] = {"git", "commit", "-a", "-m", "\"Update\""};
	char* push[] = {"git", "push"};
	printf("%i", argc);
	if(argc == 2 && strcmp(argv[1], "-a") == 0) {
		execute(add);
	}
	else if(argc == 1) {
		execute(commit);
		printf("Done");
		execute(push);
	}
	else {
		printf("Error: Unknown Prompt");
	}
	return 0;
}

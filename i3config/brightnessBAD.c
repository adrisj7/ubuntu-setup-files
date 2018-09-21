
#include<stdio.h>
#include<math.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>

#define NOTIFY_SEND_DELAY "250"
#define PIPE_READ 0
#define PIPE_WRITE 1

// Screw this, ima use C
void light(float delta);
void exec(char *args[]);
void display(char *message);

void exec(char *args[]) {
    int pid = fork();

    for(int i = 0; i < sizeof(args) / sizeof(args[0]); i++) {
        printf("list(%d) %d: %s\n", sizeof(args) / sizeof(args[0]),i, args[i]);
    }

    if (!pid) {
        if (execvp(args[0], args) == -1) {
            printf("execvp failed!\n");
        }

        exit(0);
    } else {
        wait(NULL);
    }
}

void display(char *message) {
    char *args[] = {"notify-send", "-t", NOTIFY_SEND_DELAY, message};
    exec(args);
}

void light(float delta) {
    char floatbuffer[10];
    gcvt( abs(delta), sizeof(floatbuffer), floatbuffer );
    printf("Light: %s\n", floatbuffer);
    if (delta > 0) {
        // Increase brightness
        char *args[] = {"light", "-A", floatbuffer};
        exec(args);
        display("Brightness Up");
    } else {
        // Decrease brightness
        char *args[] = {"light", "-U", floatbuffer};
        exec(args);
        display("Brightness Down");
    }
}

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Invalid arguments (needs 1, passed %d).\n", argc - 1);
        exit(1);
    }

    char *arg = argv[1];

    if (!strcmp(arg, "up")) {
        light(5);
        exit(0);
    }
    if (!strcmp(arg, "down")) {
        light(-5);
        exit(0);
    }


    return 0;
}

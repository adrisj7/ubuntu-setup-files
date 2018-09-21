#include<stdio.h>
#include<stdlib.h>

// This is dumb, I can't do this in bash so I literally write a wrapper for a wrapper
int main(int argc, char **argv) {
    // NOTE: This assumes a lot of things. One of which is that you use it 100% correctly.
    //       I got winded out after trying to do weird exec stuff with brightess.c, so I quit man
    float thing = atof(argv[1]);
    printf("%d\n", (int)thing);
}

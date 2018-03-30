#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_FNAME "/sys/class/backlight/acpi_video0/max_brightness"
#define CUR_FNAME "/sys/class/backlight/acpi_video0/brightness"

unsigned int get_value(char*);
void change_value(char*, unsigned int);

static const char *usage = "Single argument needed:\n\
info - show current; up - increase; down - decrease brightness.\n";

int
main (int argc, char *argv[])
{
    if (argc != 2) {
        fprintf(stderr, usage);
        exit(1);
    } else {
        if (strcmp(argv[1], "info") != 0 &&
                strcmp(argv[1], "up") != 0 &&
                strcmp(argv[1], "down") != 0) {
            fprintf(stderr, usage);
            exit(1);
        }
    }
    unsigned int max, cur;
    max = get_value(MAX_FNAME);
    cur = get_value(CUR_FNAME);
    if (strcmp(argv[1], "up") == 0) {
        if (cur != max)
            change_value(CUR_FNAME, ++cur);
        else
            fprintf(stderr, "Already at maximum brightness.\n");
    } else if (strcmp(argv[1], "down") == 0) {
        if (cur != 1)
            change_value(CUR_FNAME, --cur);
        else
            fprintf(stderr, "Already at minimum brightness.\n");
    } else
        fprintf(stdout, "Brightness: %u/%u.\n", cur, max);
    return 0;
}

unsigned int
get_value (char *fname)
{
    FILE *fp = fopen(fname, "r");
    if (fp == NULL) {
        fprintf(stderr, "Cannot open file: %s\n", fname);
        exit(1);
    }
    unsigned int val;
    fscanf(fp, "%u", &val);
    fclose(fp);
    return val;
}

void
change_value (char *fname, unsigned int val)
{
    FILE *fp = fopen(fname, "w");
    if (fp == NULL) {
        fprintf(stderr, "Cannot open file: %s\n", fname);
        exit(1);
    }
    fprintf(fp, "%u", val);
    fclose(fp);
}

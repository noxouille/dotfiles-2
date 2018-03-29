#include <stdio.h>
#include <string.h>

#define MAX_FNAME "/sys/class/backlight/acpi_video0/max_brightness"
#define CUR_FNAME "/sys/class/backlight/acpi_video0/brightness"

void usage();
unsigned int get_value(const char*);
void change_value(const char*, unsigned int);

int
main (int argc, char *argv[])
{
    if (argc != 2) {
        usage();
        return 1;
    } else {
        if (strcmp(argv[1], "info") != 0 &&
                strcmp(argv[1], "up") != 0 &&
                strcmp(argv[1], "down") != 0) {
            usage();
            return 1;
        }
    }
    unsigned int max, cur;
    max = get_value(MAX_FNAME);
    cur = get_value(CUR_FNAME);
    if (strcmp(argv[1], "up") == 0) {
        if (cur != max)
            change_value(CUR_FNAME, ++cur);
    } else if (strcmp(argv[1], "down") == 0) {
        if (cur != 1)
            change_value(CUR_FNAME, --cur);
    } else
        fprintf(stdout, "%u/%u\n", cur, max);
    return 0;
}

void
usage ()
{
    printf("This tool takes exactly one argument:\n\
            info - show current brightness;\n\
            up   - increase brightness;\n\
            down - decrease brightness.\n\
            Example: brcontrol up.\n");
}

unsigned int
get_value (const char *fname)
{
    FILE* fp = fopen(fname, "r");
    unsigned int val;
    fscanf(fp, "%u", &val);
    return val;
}

void
change_value (const char *fname, unsigned int to)
{
    FILE *fp = fopen(fname, "w");
    fprintf(fp, "%u", to);
}

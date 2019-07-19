#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>

void    msg(char *s)
{
    printf("%s\n", s);
}

void    translate(char *f)
{
    int fd, retval, i, j;
    unsigned char x, tmp, buf[256];

    if ((fd = open(f, O_RDONLY)) < 0)
        return msg("failed to open file");

    retval = read(fd, buf, 256);            
    close(fd);
    if (retval != 256)
        return msg("failed to read file");

    printf(".%s:\n", f);        
    i = 0;        
    while (i < 256)
    {
        if (!(i & 15))
            printf("db ");
        x = 0;
        for (j = 0; j < 4; j++)
        {
            tmp = buf[i + j] & 3;
            x = (x << 2) | tmp;
        }
        printf("0x%02x, ", x);
        i += 4;
        if (!(i & 15))
            printf("\n");
    }
    printf("\n");
}

int main()
{
    translate("frame_0");
    translate("frame_1");
    translate("frame_2");
    translate("frame_3");

    return 0;
}

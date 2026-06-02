/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <fcntl.h>
#include <sys/resource.h>

void consume_user_time()
{
    volatile unsigned long long sum = 0;
    for (unsigned long long i = 0; i < 1000000000ULL; ++i) {
        sum += i;
    }
}

void consume_system_time()
{
    char buf[4096];
    ssize_t bytes_written;

    int fd = open("/dev/null", O_WRONLY);
    if (fd == -1) {
        perror("open");
        exit(EXIT_FAILURE);
    }

    for (int i = 0; i < 4000000; ++i) {
        bytes_written = write(fd, buf, sizeof(buf));
        if (bytes_written == -1) {
            close(fd);
            exit(EXIT_FAILURE);
        }
    }

    if (close(fd) == -1) {
        exit(EXIT_FAILURE);
    }
}

int main()
{
    struct timespec start;
    clock_gettime(CLOCK_REALTIME, &start);

    consume_user_time();

    consume_system_time();

    struct rusage usage;
    getrusage(RUSAGE_SELF, &usage);

    printf("%.4f\n", start.tv_sec * 1000.0 + start.tv_nsec / 1000000.0);
    printf("%.4f\n", usage.ru_utime.tv_sec + usage.ru_utime.tv_usec / 1000000.0);
    printf("%.4f", usage.ru_stime.tv_sec + usage.ru_stime.tv_usec / 1000000.0);
    sleep(5);
    return EXIT_SUCCESS;
}

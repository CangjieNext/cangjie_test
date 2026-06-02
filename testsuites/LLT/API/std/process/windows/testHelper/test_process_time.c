/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include <unistd.h>
#include <windows.h>

void consume_user_time()
{
    volatile unsigned long long sum = 0;
    for (unsigned long long i = 0; i < 200000000ULL; ++i) {
        sum += i;
    }
}

void consume_system_time()
{
    char buf[4096];
    HANDLE hFile = CreateFile("NUL", GENERIC_WRITE, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    DWORD bytes_written;

    if (hFile == INVALID_HANDLE_VALUE) {
        printf("Failed to open NUL device\n");
        exit(EXIT_FAILURE);
    }

    for (int i = 0; i < 2000000; ++i) {
        if (!WriteFile(hFile, buf, sizeof(buf), &bytes_written, NULL)) {
            CloseHandle(hFile);
            exit(EXIT_FAILURE);
        }
    }

    if (!CloseHandle(hFile)) {
        exit(EXIT_FAILURE);
    }
}

int main()
{
    consume_user_time();
    consume_system_time();
    sleep(10);
    return EXIT_SUCCESS;
}
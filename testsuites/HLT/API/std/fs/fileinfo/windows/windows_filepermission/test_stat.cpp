/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <sys/types.h>
#include <sys/stat.h>
#include <cstdio>
#include <iostream>
#include <fstream>
using namespace std;

int main(void)
{
    struct _stat buf;
    int result;
    int count = 0;
    string extensions[4] = {{"exe"}, {"bat"}, {"com"}, {"cmd"}};
    for (int i = 0; i < 4; i++) {
        ofstream MyFile("filename." + extensions[i]);
        MyFile.close();
        string filenamestr = "filename." + extensions[i];
        char filename[100] = {0};
        for (int j = 0; j < filenamestr.length(); j++) 
        {
            filename[j]=filenamestr[j];
        }
        // Get data associated with "crt_stat.c":
        result = _stat(filename, &buf);

        if (result != 0)
        {
            printf("Problem getting information");
        }
        else
        {
            bool canExecute = ((buf.st_mode | S_IEXEC) == buf.st_mode);
            if (canExecute) {
                count ++;
            }
        }
    }
    if (count == 4)
    {
        cout << "count correctly" << endl;
    }
    else
    {
        cout << "count incorrectly" << endl;
    }
    return 0;
}
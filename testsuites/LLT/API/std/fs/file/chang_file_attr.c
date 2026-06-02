/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <windows.h>
#include <stdio.h>

int main()
{
    wchar_t* conv = L"./chang_file_attr.c";
    SetFileAttributesW(conv, FILE_ATTRIBUTE_NORMAL);
    return 0;
}

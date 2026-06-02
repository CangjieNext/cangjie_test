/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

int PassToCInt32(int in)
{
    return in;
}

int PassToCInt32_7(int a, int b, int c, int d, int e, int f, int g)
{
    int ret = 100;
    if (a == 1 && b == 2 && c == 3 && d == 4 && e == 5 && f == 6 && g == 7) {
        return ret;
    }
    return 20;
}

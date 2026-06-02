// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

extern "C" int add(int a, int b)
{
    int sum = a + b;
    printf("%d + %d = %d\n", a, b, sum);
    return sum;
}

using func_t = int(*)(int, int);
using func_t2 = void(*)(int, int);

extern "C" func_t getFuncPtr() {
    printf("this is from getFuncPtr. addr: %p\n", &add);

    return add;
}
extern "C" int a = 1;
extern "C" void getCangjieFuncPtr(func_t cb) {
    printf("this is from getCangjieFuncPtr. addr: %p\n", &cb);
    int res = cb(a++, 2);
    if (res == (a + 1)) {
        printf("cb success.\n");
    } else {
        printf("fail.\n");
    }
}

extern "C" void getCangjieFuncPtr2(func_t2 cb) {
    printf("this is from getCangjieFuncPtr2. addr: %p\n", &cb);
    cb(5, 6);
}
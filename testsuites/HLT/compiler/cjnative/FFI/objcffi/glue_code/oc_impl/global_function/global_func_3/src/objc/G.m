/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 #import "M.h"

int global_func(M *p0, int p1, float p2) {
    printf("global_func, p1 = %d, p2 = %f\n", p1, p2);
    [p0 mFoo];
    return 123;
}
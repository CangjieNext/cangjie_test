/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: define_20006.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt define_20006.cj -o define.%middle
// EXEC: echo "define=./define.cjo" > define.cfg
// EXEC: %compiler %cmp_opt define.%middle %f        -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import define.*

enum E<T> {
    | e(T, T)
    | e(T, T, T)
    | e(T, T, T, T)
}

func e<T>(i1: T, i2: T, i3: T, i4: T, i5: T) {}

main(): Int64 {
    F.e(1)
    E.e(1, 1, 1)
    E.e(1, 1, 1, 1)
    e(1, 1, 1, 1, 1)
    return 0
}

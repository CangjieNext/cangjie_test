/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum E<T> {
    | e(T, T)
    | e(T, T, T)
    | e(T, T, T, T)
}

func e<T>(i: T) {}

main(): Int64 {
    e(1)
    E.e(1, 1)
    E.e(1, 1, 1)
    E.e(1, 1, 1, 1)
    return 0
}

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

enum A<T> {
    a(T)

    public operator func +(y: A<T>) {
        return 1
    }
}

main(): Int64 {
    var i = A<Int64>.a(1)
    var x = i + i
    if (x == 1) {
        return 0
    }
    return 1
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct B<T> {
    public operator func *(b: B<T>): Bool {
        return true
    }
}

class A<T> {
    public operator func *(b: B<T>): Bool {
        return true
    }
}

main(): Int64 {
    var a: A<Int32> = A<Int32>()
    var b: B<Int32> = B<Int32>()
    if (a * b) {
        return 0
    }
    return 1
}

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

interface I<T> {
    static const func f0<T>(a: T): T
    static const func f0(a: T): T
}

class C<T> <: I<T> {
    let a0 = 0
    public static const func f0<T>(a: T): T {
        a
    }

    public static const func f0(a: T): T {
        a
    }
}

main() {
    let c0 = C<Int64>()
    if (c0.a0 == 0 && C<String>.f0<String>("1") == "1" && C<Int32>.f0(123) == 123) {
        return 0
    }
    return 1
}

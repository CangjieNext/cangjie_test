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
    static const func f0<T>(a: T): Unit
    static const func f0(a: T): Unit
}

open class C<T> <: I<T> {
    let a0 = 0
    public static const func f0<T>(a: T) {}
    public static const func f0(a: T) {}
}

class C1 <: C<Int64> {}

const func ff<T>() where T <: C1 {
    return 0
}

main() {
    if (ff<C1>() == 0) {
        return 0
    }
    return 1
}

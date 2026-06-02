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

class C<T> {
    static const func f0(a: T): Unit {}
    static const func f1(a: T): Int64 {
        return 1
    }
    static const func f2() {
        return 20
    }
}

struct S<U> {
    static const func g0(a: U): Unit {}
    static const func g1(a: U) {
        return 300
    }
    static const func g2(): Int64 {
        return 4000
    }
}

const func ff() {
    return C<String>.f1("") + C<String>.f2() + S<Byte>.g1(0) + S<UInt16>.g2()
}

main() {
    if (ff() != 4321) {
        return 1
    }
    0
}

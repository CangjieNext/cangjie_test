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

type A<T, k> = classA<T, k>

interface I {
    func c() {
        "345"
    }
}

extend<T, K> classA<T, K> <: I {}

class classA<T, K> {
    public var a: T
    public var b: K
    public classA(x: T, y: K) {
        this.a = x
        this.b = y
    }
}

main(): Int64 {
    func a(a: A<Rune, String>) {
        return a.a.toString() + a.b + A<Rune, String>(r'#', "345").c()
    }
    if (a(A<Rune, String>(r'#', A<Rune, String>(r'#', "345").c())) == "#345345") {
        return 0
    } else {
        return 1
    }
}

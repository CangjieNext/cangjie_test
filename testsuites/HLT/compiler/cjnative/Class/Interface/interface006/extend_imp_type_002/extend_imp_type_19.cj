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

type str = String

type B = I

interface I {
    static prop i: str {
        get() {
            var a: str = "extend"
            return a
        }
    }
}

extend str <: B {}

struct A<T> {
    public var a: str = str.i
    public init(a!: str = str.i) {
        this.a = a
    }
}

main(): Int64 {
    var a: A<str> = A<str>()
    if (a.a == "extend") {
        return 0
    } else {
        return 1
    }
}

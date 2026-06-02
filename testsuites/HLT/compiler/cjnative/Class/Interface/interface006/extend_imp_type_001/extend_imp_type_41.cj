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

enum enumA {
    F(Int64)
}

type A = enumA

interface I {
    prop i: enumA {
        get() {
            var a: enumA = enumA.F(4)
            return a
        }
    }
}

extend A <: I {}

struct structA {
    public func f1(): A {
        A.F(1).i
    }
    public static func f2(a: A) {
        var b: Int64 = match (a) {
            case F(x) => x
            case _ => 0
        }
        return b
    }
}

main(): Int64 {
    var c: Int64 = match (structA().f1()) {
        case F(x) => x
        case _ => 0
    }

    if (c + structA.f2(A.F(2).i) == 8) {
        return 0
    } else {
        return 1
    }
}

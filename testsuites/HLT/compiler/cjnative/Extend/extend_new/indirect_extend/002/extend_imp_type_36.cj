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
    | A | B
}

type enA = enumA

type A = I

interface I {
    func a() {
        enA.A
    }
}

extend enA <: A {
    public func a() {
        enA.A
    }
}

main(): Int64 {
    var a: enA = enA.B.a()
    var b: Int64 = match (a) {
        case A => 1
        case B => 2
        case _ => 3
    }
    if (b == 1) {
        return 0
    } else {
        return 1
    }
}

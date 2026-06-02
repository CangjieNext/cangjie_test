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

struct structA {
    public var a: Int64 = 1
}

type rdA = structA

extend rdA {
    public static func b(a: Int64) {
        a
    }
}

enum enumA {
    | A(Int64)
}

main(): Int64 {
    var a: enumA = A(rdA.b(1))
    var b: Int64 = match (a) {
        case A(x) => x
        case _ => 2
    }

    if (b == 1) {
        return 0
    } else {
        return 1
    }
}

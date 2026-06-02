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

type A = classA

class classA {}

extend A {
    public func a() {
        1
    }
}

enum B {
    year(Int64)
}

main(): Int64 {
    var a: B = year(A().a())

    var b: Int64 = match (a) {
        case year(x) => x
        case _ => 0
    }

    if (b == 1) {
        return 0
    } else {
        return 1
    }
}

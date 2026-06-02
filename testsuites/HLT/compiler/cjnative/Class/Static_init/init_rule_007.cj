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

var top: Int64 = 0

class A {
    var a1 = 1
}

struct B {
    var a2 = 1
}

enum C {
    E | F
}

struct rec {
    static let b1: A
    static var b2: B
    static let b3: C

    static init() {
        b1 = A()
        b2 = B()
        b3 = E

        top = match (b3) {
            case E => 1
            case F => 2
        }
    }
}

main(): Int64 {
    if (rec.b1.a1 == 1 && rec.b2.a2 == 1 && top == 1) {
        return 0
    }
    return 1
}

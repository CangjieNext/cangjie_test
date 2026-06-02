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

class Test {
    var a: Int64 = 1
    static var b: Int64 = 2

    func foo() {
        3
    }

    static func fooB() {
        4
    }

    mut open prop pA: Int64 {
        get() {
            5
        }
        set(v) {}
    }

    static prop pB: Int64 {
        get() {
            6
        }
    }
}

var a = Test().a != 1 || Test.b != 2 || Test().foo() != 3 || Test.fooB() != 4 || Test().pA != 5 || Test.pB != 6

main() {
    if (a) {
        return 1
    }
    return 0
}

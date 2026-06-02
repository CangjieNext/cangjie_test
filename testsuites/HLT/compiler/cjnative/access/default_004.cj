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

class Test {}

extend Test {
    func foo() {
        3
    }

    static func fooB() {
        4
    }

    mut prop pA: Int64 {
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

main() {
    if (Test().foo() != 3 || Test.fooB() != 4 || Test().pA != 5 || Test.pB != 6) {
        return 1
    }
    return 0
}

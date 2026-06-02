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

interface define18 {
    func foo1(): Array<Float16> {
        return [1.00, 5.00, 3.22]
    }
}

interface define_18 {
    static func foo2(): Array<UInt32>
}

class A <: define18 & define_18 {
    public static func foo2(): Array<UInt32> {
        return [1, 5, 3]
    }
}

main(): Int64 {
    if (A().foo1()[0] == 1.00 && A().foo1()[1] == 5.00 && A().foo1()[2] == 3.22 && A.foo2()[0] == 1 && A.foo2()[1] == 5 &&
        A.foo2()[2] == 3) {
        return 0
    }

    return 1
}

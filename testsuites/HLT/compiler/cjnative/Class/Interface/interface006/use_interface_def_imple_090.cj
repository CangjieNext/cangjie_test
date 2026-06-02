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

public interface fatherInterface {
    prop b: Int64
    prop b1: Int64 {
        get() {
            b
        }
    }
}

interface MyInterface <: fatherInterface {
    prop b2: Int64 {
        get() {
            b1
        }
    }
}

extend UInt32 <: MyInterface {
    func foo() {
        3
    }
    public prop b: Int64 {
        get() {
            foo()
        }
    }
}

main() {
    var u1: MyInterface = UInt32(1)
    var u2: MyInterface = UInt32(1)
    var u3: UInt32 = 1

    if (u1.b1 == 3 && u2.b2 == 3 && u3.b1 == 3 && u3.b2 == 3) {
        return 0
    } else {
        return 1
    }
}

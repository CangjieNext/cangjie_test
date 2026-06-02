/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f --mock=on -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I {
    operator func -(): Int32 {
        return 100
    }
    operator func -(input: Int64): Int32 {
        return Int32(-100)
    }
}

class A <: I {
    public var x: Int32

    public operator func -(): Int32 {
        return 100
    }

    public operator func -(input: Int32): Int32 {
        return -100
    }

    public init(x: Int32) {
        this.x = x
    }
}

main(): Int32 {
    var a = A(100)
    a.x -= 100

    return a.x
}

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

interface Number {
    operator func %(right: Number): Number

    func as_ui32(): UInt32
}

extend UInt32 <: Number {
    public operator func %(right: Number): Number {
        this % right.as_ui32() + 2
    }

    public func as_ui32(): UInt32 {
        this
    }
}

main(): Int64 {
    var a: Number = UInt32(6)

    a %= UInt32(3)

    var c = a.as_ui32() - 2

    return Int64(c)
}

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
    operator func <<(right: Number): Number

    func as_i16(): Int16
}

extend Int16 <: Number {
    public operator func <<(right: Number): Number {
        this << right.as_i16() + 2
    }

    public func as_i16(): Int16 {
        this
    }
}

main(): Int64 {
    var a: Number = Int16(2)

    a <<= Int16(1)

    var c = a.as_i16() - 16

    return Int64(c)
}

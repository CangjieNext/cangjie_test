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

open class Base<T> {
    public var a: Int32
    public init(x: Int32) {
        a = x
    }
}

class Data<T> <: Base<T> {
    public var aa: Int32
    public init(x: Int32) {
        super(x)
        aa = x + 1
    }
}

func foo(x: Int32): Base<Int32> {
    return Data<Int32>(x)
}

main(): Int64 {
    var base: Base<Int32> = foo(4)
    var res: Int32 = base.a
    if (res == 4) {
        return 0
    }
    return 1
}

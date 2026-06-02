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

open class Father {
    public var a: Int32
    public var b: Int32
    public init(x: Int32, y: Int32) {
        a = x
        b = y
    }
}

class Child <: Father {
    public var c: Int32
    public var d: Int32
    public init(x: Int32, y: Int32) {
        super(0, 0)
        c = x
        d = y
    }
}

open class Base<T> {
    public init(x: T) {}
    public open func foo(x: Int32, y: Int32): Father {
        return Father(x, y)
    }
}

class Data<T> <: Base<T> {
    public init(x: T) {
        super(x)
    }
    public override func foo(x: Int32, y: Int32): Child {
        return Child(x, y)
    }
}

main(): Int64 {
    var data: Data<Int32> = Data<Int32>(0)
    var res: Child = data.foo(3, 4)
    var res1: Int32 = res.c
    var res2: Int32 = res.d
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

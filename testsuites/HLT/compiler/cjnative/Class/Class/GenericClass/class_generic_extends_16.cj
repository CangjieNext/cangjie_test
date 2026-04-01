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

open class Father<V> {
    public var a: V
    public var b: V
    public init(x: V, y: V) {
        a = x
        b = y
    }
}

class Child<U> <: Father<U> {
    public var c: U
    public var d: U
    public init(x: U, y: U) {
        super(x, y)
        c = x
        d = y
    }
}

open class Base<T> {
    public init(x: T) {}
    public open func foo<V>(x: V, y: V): Father<V> {
        return Father<V>(x, y)
    }
}

class Data<T> <: Base<T> {
    public init(x: T) {
        super(x)
    }
    public override func foo<U>(x: U, y: U): Child<U> {
        return Child<U>(x, y)
    }
}

main(): Int64 {
    var data: Data<Int32> = Data<Int32>(1)
    var res: Child<Int32> = data.foo<Int32>(3, 4)
    var res1: Int32 = res.c
    var res2: Int32 = res.d
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_invalid_generic_function_in_class

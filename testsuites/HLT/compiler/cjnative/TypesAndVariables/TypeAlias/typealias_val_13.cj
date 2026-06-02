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

class Base<T> {
    public var b: T
    public init(x: T, y: str) {
        b = x
    }
}

type int = Int32

type str = String

type B<T> = Base<T>

struct Data<V> {
    public var a: B<V>
    public init(x: B<V>, y: str) {
        a = x
    }
    public func foo(x: B<V>): V {
        return x.b
    }
}

main(): Int64 {
    var i: int = 3
    let s: str = "hi"
    var b: B<int> = Base<int>(i, s)
    var data: Data<int> = Data<int>(b, s)
    var res1 = data.a.b
    var res2 = data.foo(b)
    if (res1 == 3 && res2 == 3) {
        return 0
    }
    return 1
}

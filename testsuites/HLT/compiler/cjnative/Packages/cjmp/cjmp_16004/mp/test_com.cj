/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common interface I {
    common func foo<T>(): Int64 {
        1
    }
}
public class A <: I {}
public common class C {
    public init() {}
    public common func foo<T>(): Int64 {
        1
    }
}
public common struct S {
    public init() {}
    public common func foo<T>(): Int64 {
        1
    }
}
public common enum E {
    | E1
    public common func foo<T>(): Int64 {
        1
    }
}
public func f1() {
    A().foo<Int64>() + C().foo<Int64>() + S().foo<Int64>() + E1.foo<Int64>()
}

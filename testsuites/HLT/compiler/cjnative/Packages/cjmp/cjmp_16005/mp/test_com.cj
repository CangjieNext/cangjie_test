/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common interface I<K> {
    common func foo<K>(a: K, b: K): K {
        a
    }
}
public class A<K> <: I<K> {}
public common class C<K> {
    public init() {}
    public common func foo<K>(a: K, b: K): K {
        a
    }
}
public common struct S<K> {
    public init() {}
    public common func foo<K>(a: K, b: K): K {
        a
    }
}
public common enum E<K> {
    | E1
    public common func foo<K>(a: K, b: K): K {
        a
    }
}
public func f1() {
    A<String>().foo<Int64>(1, 2) + C<String>().foo<Int64>(1, 2) + S<String>().foo<Int64>(1, 2) + E1<String>.foo<Int64>(1, 2)
}

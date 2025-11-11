/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform interface I<K> {
    platform func foo<K>(a: K, b: K): K {
        b
    }
}
public platform class C<K> {
    public platform func foo<K>(a: K, b: K): K {
        b
    }
}
public platform struct S<K> {
    public platform func foo<K>(a: K, b: K): K {
        b
    }
}
public platform enum E<K> {
    | E1
    public platform func foo<K>(a: K, b: K): K {
        b
    }
}
public func f2() {
    A<String>().foo<Int64>(1, 2) + C<String>().foo<Int64>(1, 2) + S<String>().foo<Int64>(1, 2) + E1<String>.foo<Int64>(1, 2)
}

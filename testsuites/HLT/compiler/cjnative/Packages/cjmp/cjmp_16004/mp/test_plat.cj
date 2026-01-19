/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform interface I {
    platform func foo<T>(): Int64 {
        2
    }
}
public platform class C {
    public platform func foo<T>(): Int64 {
        2
    }
}
public platform struct S {
    public platform func foo<T>(): Int64 {
        2
    }
}
public platform enum E {
    | E1
    public platform func foo<T>(): Int64 {
        2
    }
}
public func f2() {
    A().foo<Int64>() + C().foo<Int64>() + S().foo<Int64>() + E1.foo<Int64>()
}

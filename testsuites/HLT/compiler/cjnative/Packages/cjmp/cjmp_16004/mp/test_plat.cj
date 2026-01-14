/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific interface I {
    specific func foo<T>(): Int64 {
        2
    }
}
public specific class C {
    public specific func foo<T>(): Int64 {
        2
    }
}
public specific struct S {
    public specific func foo<T>(): Int64 {
        2
    }
}
public specific enum E {
    | E1
    public specific func foo<T>(): Int64 {
        2
    }
}
public func f2() {
    A().foo<Int64>() + C().foo<Int64>() + S().foo<Int64>() + E1.foo<Int64>()
}

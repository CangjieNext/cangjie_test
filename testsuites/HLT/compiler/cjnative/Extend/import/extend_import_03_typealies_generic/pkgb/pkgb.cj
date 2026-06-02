/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgb

import pkga.*

public interface I<T> {
    static func foo() {
        1
    }
}

public interface II<T> <: I<T> {
    func foo2() {
        1
    }
    public func plus(a: A<T>, b: A<T>): Int64
}

public type TA<T> = A<T>

extend<T> TA<T> <: II<T> {
    public func plus(a: A<T>, b: A<T>): Int64 {
        foo() + foo2()
    }
}

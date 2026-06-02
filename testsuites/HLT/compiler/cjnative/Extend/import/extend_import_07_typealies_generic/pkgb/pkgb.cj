/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgb

import pkga.TA

public interface I<T> {
    static func foo() {
        1
    }
}

interface II<T> {
    func foo2() {
        1
    }
}

public type TI<T> = I<T>

extend<T> TA<T> <: II<T> & TI<T> {
    func plus(a: TA<T>, b: TA<T>): Int64 {
        foo() + foo2()
    }
}

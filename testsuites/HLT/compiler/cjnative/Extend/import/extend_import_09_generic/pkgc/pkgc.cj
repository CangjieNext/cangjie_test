/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgc

import pkga.A

public interface I2<T> {
    func foo() {
        1
    }
    public func plus(a: A<Int64>, b: A<Int64>): Int64
}

extend<T> A<T> <: I2<T> {
    public func plus(a: A<Int64>, b: A<Int64>): Int64 {
        foo()
    }
}

// ASSERT: regex-not :5:.*-not error

// ASSERT: regex :11:.* function 'plus' has overload conflicts

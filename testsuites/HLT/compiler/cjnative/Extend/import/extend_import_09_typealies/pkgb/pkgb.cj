/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgb

import pkga.TA

public interface I {
    func foo() {
        1
    }
    public func plus(a: TA, b: TA): Int64
}

extend TA <: I {
    public func plus(a: TA, b: TA): Int64 {
        foo()
    }
}

// ASSERT: regex :10:.*error.*?function 'foo' has overload conflicts
// ASSERT: regex :11:.*error.*?function 'plus' has overload conflicts
// ASSERT: regex-not :5:.*error

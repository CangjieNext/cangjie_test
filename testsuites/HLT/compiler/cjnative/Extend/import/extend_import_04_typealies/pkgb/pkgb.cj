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
    static func foo() {
        1
    }
}

interface II <: I {
    func foo2() {
        1
    }
}

extend TA <: II {
    func plus(a: TA, b: TA): Int64 {
        foo() + foo2()
    }
}

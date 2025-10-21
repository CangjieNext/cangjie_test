/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.navigation

open class _C10 {
    public open func bar2(x: Int64): Int64 {
        return x
    }
}

class Data10 <: _C10 {
    func bar2(): String {
        "bar"
    }
    public override func bar2(x: Int64): Int64 {
        return x + 2
    }
}

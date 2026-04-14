/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package module_sealed.pkg

sealed interface ISealedBase {
    func getValue(): Int64
}

class SealedImpl1 <: ISealedBase {
    public func getValue(): Int64 {
        1
    }
}

class SealedImpl2 <: ISealedBase {
    public func getValue(): Int64 {
        2
    }
}

class SealedImpl3 <: ISealedBase {
    public func getValue(): Int64 {
        3
    }
}

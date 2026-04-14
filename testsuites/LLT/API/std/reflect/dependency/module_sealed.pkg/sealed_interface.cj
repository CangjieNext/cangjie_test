/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
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
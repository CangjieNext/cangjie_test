// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package lib

public enum MaybeInt {
    | None
    | Some(Int64)
}

public func foo(x: Int64): MaybeInt {
    if (x > 0) {
        return MaybeInt.Some(x)
    } else {
        return MaybeInt.None
    }
}

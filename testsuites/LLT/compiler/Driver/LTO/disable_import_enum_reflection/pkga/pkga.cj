// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkga

public enum E {
    | A(Int32)
    | B

    public func tag(): Int32 {
        match (this) {
            case A(v) => return v
            case B => return 0
        }
    }
}

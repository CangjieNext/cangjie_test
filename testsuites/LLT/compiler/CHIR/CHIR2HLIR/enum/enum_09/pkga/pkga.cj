// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkga

public enum Time<T> {
    Date
    | Hour(Bool, T)
    | Year(Rune, Int8, T)

    public func f() {
        1
    }
    public prop val: Int64 {
        get() {
            2
        }
    }
    public static func f2() {
        3
    }
}

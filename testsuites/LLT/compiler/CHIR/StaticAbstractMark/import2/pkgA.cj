// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgA

public interface I {
    static func ff1(): Int64
    func ff2(): Unit
}

extend Int64 <: I {
    public static func ff1(): Int64 {
        3
    }
    public func ff2() {
        ()
    }
}

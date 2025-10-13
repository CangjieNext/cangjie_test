// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public struct Rectangle {
    public Rectangle(public var width: Int32, public let length: Int32, public var f: (Int32) -> Int32) {}
    public func count(a: Int32) {
        a
    }
    public func count() {
        length
    }
}

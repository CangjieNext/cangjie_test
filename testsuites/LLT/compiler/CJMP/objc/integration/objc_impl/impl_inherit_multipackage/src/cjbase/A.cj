// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjbase

import objc.lang.*

@ObjCMirror
public open class M {
    public init()
}

@ObjCImpl
public open class A <: M {
    /// Moved into `A$reg`, so a subtype in another package reaches it through the restored companion parent.
    public var shared: Int64 = 0

    public static var trace: Int64 = 0

    public init() {}

    public open func tag(): Int64 {
        1
    }

    public static func mark(): Unit {
        trace = trace * 10 + 1
    }
}

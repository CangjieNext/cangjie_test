// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjworld

import objc.lang.*
// import objc.foundation.NSObject
// import introplib.objc.*

@ObjCMirror
public interface I {
    @ObjCOptional
    func f1(n: Int32): Unit
    @ObjCOptional
    static func f2(): Unit
}

@ObjCMirror
open class M <: I {
    @ForeignName["init"]
    public init()

    public static func f2(): Unit
}

// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjworld

import objc.lang.*

@ObjCMirror
open class M <: NSObject {
    public init()
    public static func helloAscii(): NSString
    public static func helloCyrillic(): NSString
    public static func helloCangjie(): NSString
    public static func helloEmoji(): NSString
    public static func empty(): NSString
    public static func long(): NSString
    public static func uppercase(str: NSString): NSString
    public static func checkUpperHelloAscii(str: NSString): Unit
    public static func checkExportedImpl(): Unit
}

@ObjCMirror
public open class NSObject {
    public init()
}

@ObjCMirror
public class NSString <: NSObject {
    public init()
    public func isEqual(rhs: ObjCId): Bool
}

extend NSString <: Equatable <NSString> {
    public operator func ==(rhs: NSString): Bool {
        isEqual(rhs)
    }
}

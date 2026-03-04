// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import java.lang.JObject

@JavaMirror["com.java.lib.Exe"]
public open class Exe {
    public init()
    public static func GetJBase(): JBase
    public static func PrintStringStatic (s: String): Unit
    public func PrintString(s: String): Unit
    public open func GetOptString(): ?String
    public open func GetArgStringOpt(arg: ?String): Unit

}

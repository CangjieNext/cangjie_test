// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import java.lang.JObject

@JavaMirror["com.java.lib.JBase"]
public open class JBase {
    public init()
    public func GetJString(): String
    public func GetJStringOption(): ?String
    public func GetArgJString(arg: String): String
}

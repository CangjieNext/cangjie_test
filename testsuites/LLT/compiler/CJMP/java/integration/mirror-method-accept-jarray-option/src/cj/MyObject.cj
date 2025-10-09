// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*
import java.lang.*

@JavaMirror["com.java.lib.MyObject"]
open class MyObject <: JObject {
    public init()
    public func getSize(arr: JArray<?JObject>): Int32
    public func hasNull(arr: JArray<?JObject>): Bool
    public func isNull(obj: ?JObject): Bool
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class Main <: JObject {
    @ForeignName["main"]
    public static func entry(args: JArray<JString>): Unit {
        print("cj: Main()\n", flush: true)

        let obj = MyObject(1)
        print("cj: ${obj.x} ${obj.y} ${MyObject.sx} ${MyObject.sy}\n", flush: true)
        obj.x = false
        print("cj: var x modify\n", flush: true)
        MyObject.sx = 11
        print("cj: static var sx modify\n", flush: true)
        print("cj: ${obj.x} ${obj.y} ${MyObject.sx} ${MyObject.sy}\n", flush: true)
        print("cj: Main() end\n", flush: true)
    }
}

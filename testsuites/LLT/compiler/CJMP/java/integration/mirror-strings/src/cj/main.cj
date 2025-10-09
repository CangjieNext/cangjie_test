// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*
import java.lang.JObject
import java.lang.JString

@JavaMirror["com.java.lib.JBase"]
public open class JBase {
    public init()

    public func GetJString(): String
    public func GetOptJString(): ?String
    public func GetOptNullJString(): ?String
}

@JavaMirror["com.java.lib.Exe"]
public open class Exe {
    public init()

    public static func GetJBase(): JBase
    public static func IntToString(x: Int32): ?String

    public static func PrintString(s: JString): Unit
    public static func PrintOptString(s: ?JString): Unit
}

@JavaImpl
public class CjExe <: Exe {
    public init(doTest: Bool) {
        if (!doTest) { return }

        let jb = GetJBase()
        println("GetJString(): ${jb.GetJString()}")
        println("GetOptJString(): ${jb.GetOptJString()}")
        println("GetOptNullJString(): ${jb.GetOptNullJString()}")
        println("IntToString(0): ${IntToString(0)}")
        println("IntToString(42): ${IntToString(42)}")

        print("=== Java ===\n", flush: true)
        PrintString(JString("From CJ"))
        PrintOptString(JString("Some from CJ"))
        PrintOptString(None)
    }
}


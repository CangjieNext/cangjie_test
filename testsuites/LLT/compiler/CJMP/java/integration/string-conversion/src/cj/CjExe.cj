// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

@JavaImpl
public class CjExe <: Exe {

    public func PrintString1(s: String): Unit {
        println(s)
        PrintString("String from cj to JavaMirror super call")
        PrintString(s)
    }

    var strField: String = "field"

    public func GetString (arg: Bool): String {
        if (arg) {"String"} else {strField}
    }

    public func GetStringOption(): ?String {
      "String"
    }

    public func GetStringOptionNone(): ?String {
      None
    }


    public override func GetArgStringOpt(arg: ?String): Unit {
        println("GetArgStringOpt(arg): ${arg}")
    }


    public init(doTest: Bool) {
        if (!doTest) { return }
        PrintString1("String from cj to cj")
        print("=== Java ===\n", flush: true)
        let exe = Exe()
        exe.PrintString("String from cj to JavaMirror call")
        Exe.PrintStringStatic("String from cj to JavaMirror static call")
        let jb = GetJBase()
        let res = jb.GetArgJString("arg")
        println("GetArgJString(arg): ${res}")
        println("GetJString(): ${jb.GetJString()}")
        println("GetJStringOption(): ${jb.GetJStringOption()}")
    }
}


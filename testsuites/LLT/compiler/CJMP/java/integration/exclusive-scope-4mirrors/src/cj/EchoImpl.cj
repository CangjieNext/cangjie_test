// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

import java.lang.*

@JavaImpl["test.EchoImpl"]
public class EchoImpl  {
    public init(){}


    // This test intentionally exercises different JNI interaction paths
    // inside spawn: mirror constructor, JObject constructor, getters,
    // setters, nullable handling, method calls and object arguments.
    // Missing exclusiveScope wrapping in any of these paths may cause
    // runtime failures when lightweight threads migrate between carriers.
    public func callJavaWithSpawn(): Int {
        println("Runnning  callJavaWithSpawn()")
        let res: Future<Int64> = spawn {
            println("inside spawn")
            runMirrorOps()
        }
        println("Exit callJavaWithSpawn()")
        return res.get()
    }

    public func runMirrorOps(): Int {
        println("Runnning runMirrorOps()")
        let o = JObject()
        o.toString()
        let s1 = JString("JString")
        println(s1.toString())
        let s2 = JString("")
        println(s2.toString())
        let s3 = JString()
        println(s3.toString())
        let echoMirror = EchoMirror()
        println(echoMirror.objField?.toString())
        let j = JString("String1")
        println(j.toString())
        echoMirror.objField = j
        println(echoMirror.objField?.toString())
        println(j.toString())
        println(echoMirror.objField?.toString())
        echoMirror.objField = None
        println(echoMirror.objField?.toString())
        let res1 = echoMirror.foo(23)
        let res2 = echoMirror.foo(2)
        echoMirror.goo(echoMirror)
        println(res1 + res2)
        println("Exit runMirrorOps()")
        return res1 + res2
    }
}

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
        print("Runnning  callJavaWithSpawn()\n", flush: true)
        let res: Future<Int64> = spawn {
            print("inside spawn\n", flush: true)
            runMirrorOps()
        }
        print("Exit callJavaWithSpawn()\n", flush: true)
        return res.get()
    }

    public func runMirrorOps(): Int {
        print("Runnning runMirrorOps()\n", flush: true)
        let o = JObject()
        o.toString()
        let s1 = JString("JString")
        print(s1.toString() + "\n", flush: true)
        let s2 = JString("")
        print(s2.toString() + "\n", flush: true)
        let s3 = JString()
        print(s3.toString() + "\n", flush: true)
        let echoMirror = EchoMirror()
        print(echoMirror.objField?.toString(), flush: true)
        print("\n", flush: true)
        let j = JString("String1")
        print(j.toString() + "\n", flush: true)
        echoMirror.objField = j
        print(echoMirror.objField?.toString(), flush: true)
        print("\n", flush: true)
        print(j.toString() + "\n", flush: true)
        print(echoMirror.objField?.toString(), flush: true)
        print("\n", flush: true)
        echoMirror.objField = None
        print(echoMirror.objField?.toString(), flush: true)
        print("\n", flush: true)
        let res1 = echoMirror.foo(23)
        let res2 = echoMirror.foo(2)
        echoMirror.goo(echoMirror)
        print("${res1 + res2}\n", flush: true)
        print("Exit runMirrorOps()\n", flush: true)
        return res1 + res2
    }
}

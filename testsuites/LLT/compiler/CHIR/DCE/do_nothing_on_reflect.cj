// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args %output

package myPackage

import std.reflect.*

public func goo() {
    print("ok global\n")
    0
}

public class MyData {
    let a: Int64 = 1
    public func foo(): Int64 {
        print("ok\n")
        0
    }
    public static func goo(): Int64 {
        print("static ok\n")
        0
    }
}

main() {
    let t1 = PackageInfo.get("myPackage")
    t1.getFunctions("goo")[0].apply([])

    let t3 = TypeInfo.of<MyData>()
    let myFoo = t3.getInstanceFunction("foo", [])
    let myGoo = t3.getStaticFunction("goo", [])
    myFoo.apply(MyData())
    myGoo.apply(TypeInfo.of<MyData>(), [])
    0
}
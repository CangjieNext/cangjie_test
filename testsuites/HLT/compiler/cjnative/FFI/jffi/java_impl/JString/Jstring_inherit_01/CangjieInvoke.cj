/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// DEPENDENCE: Main.java com 
// (not Windows and Android) EXEC: %java %java_mirror_gen com.JavaClass
// (not Windows and Android) EXEC: %java %java_mirror_gen com.JavaClass_Child
// (not Windows and Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) EXEC: %javac %cp_loader_jar Main.java com/*.java CangjieInvoke.java Cangjie_Invoke.java -h . -d .
// (not Windows and Android) EXEC-PIPE: %java %cp_loader_jar -Djava.library.path=. Main 2>&1 | compare %f
// (not Windows and Android) ASSERT: scan run java Main
// (not Windows and Android) ASSERT: scan in JavaClass Init
// (not Windows and Android) ASSERT: scan in JavaClass_Child Init
// (not Windows and Android) ASSERT: scan in JavaClass_Child subfoo
// (not Windows and Android) ASSERT: scan in JavaClass Init
// (not Windows and Android) ASSERT: scan in JavaClass_Child Init
// (not Windows and Android) ASSERT: scan in JavaClass_Child foo
// (not Windows and Android) ASSERT: scan in JavaClass_Child subfoo
// (not Windows and Android) ASSERT: scan in JavaClass_Child goo
// (not Windows and Android) ASSERT: scan 66666
// (not Windows and Android) ASSERT: scan 111
// (not Windows and Android) ASSERT: scan 100
// (not Windows and Android) ASSERT: scan 88888
// (not Windows and Android) ASSERT: scan 200
// (not Windows and Android) ASSERT: scan 666
// (not Windows and Android) ASSERT: scan 888

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class Cangjie_Invoke <: JavaClass_Child {
    public init() {
        println("in CangjieInvoke Init")
    }

    public override func foo(v1: Int32): Int32 {
        66666
    }

    public static redef func goo(v1: Int32, v2: Int32): Int32 {
        88888
    }
}

@JavaImpl
public class CangjieInvoke <: JObject {
    public init(v1: Int32) {
        let cjinvoke = Cangjie_Invoke()
        cjinvoke.foo(v1) |> println
        cjinvoke.subfoo(v1) |> println
        cjinvoke.value1 |> println
        cjinvoke.subvalue1 |> println
        Cangjie_Invoke.goo(v1, v1) |> println
        Cangjie_Invoke.value2 |> println
        Cangjie_Invoke.subvalue2 |> println

        let javainvoke = JavaClass_Child()
        javainvoke.foo(v1) |> println
        javainvoke.subfoo(v1) |> println
        javainvoke.value1 |> println
        javainvoke.subvalue1 |> println
        JavaClass_Child.goo(v1, v1) |> println
        JavaClass_Child.value2 |> println
        JavaClass_Child.subvalue2 |> println
    }
}

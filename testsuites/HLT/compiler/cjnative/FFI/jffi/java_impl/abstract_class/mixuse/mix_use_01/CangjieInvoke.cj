/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// DEPENDENCE: Main.java com
// (not Windows and Android) EXEC: %javac com/*.java
// (not Windows and Android) EXEC: %java %java_mirror_gen com.JavaClass
// (not Windows and Android) EXEC: cat UNNAMED/src/*.cj
// (not Windows and Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) EXEC: %javac %cp_loader_jar Main.java com/*.java CangjieInvoke.java -h . -d .
// (not Windows and Android) EXEC-PIPE: %java %cp_loader_jar -Djava.library.path=. Main 2>&1 | compare %f
// (not Windows and Android) ASSERT: scan run java Main
// (not Windows and Android) ASSERT: scan I1.goo1 + goo2 : 3
// (not Windows and Android) ASSERT: scan C1.goo1 + goo2 : 12
// (not Windows and Android) ASSERT: scan JavaClass goo1: 510
// (not Windows and Android) ASSERT: scan JavaClass goo2: 520
// (not Windows and Android) ASSERT: scan javaClass foo1: 51
// (not Windows and Android) ASSERT: scan javaClass foo2: 52

package UNNAMED

import java.lang.JObject

@JavaImpl
public class CangjieInvoke <: JavaClass {
    public init() {
        println("in CangjieInvoke Init")
        // check I1
        println("I1.goo1 + goo2 : ${I1.goo1() + I1.goo2()}")

        // check abstract class C1
        println("C1.goo1 + goo2 : ${C1.goo1() + C1.goo2()}")

        // check class JavaClass
        var javaClass = JavaClass()
        println("JavaClass goo1: ${JavaClass.goo1()}")
        println("JavaClass goo2: ${JavaClass.goo2()}")
        println("javaClass foo1: ${javaClass.foo1()}")
        println("javaClass foo2: ${javaClass.foo2()}")
    }
}

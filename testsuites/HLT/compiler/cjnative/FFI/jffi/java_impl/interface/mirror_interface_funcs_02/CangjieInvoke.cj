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
// (not Windows and Android) EXEC: %java %java_mirror_gen com.I1
// (not Windows and Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) EXEC: %javac %cp_loader_jar Main.java com/*.java CangjieInvoke.java -h . -d .
// (not Windows and Android) EXEC-PIPE: %java %cp_loader_jar -Djava.library.path=. Main 2>&1 | compare %f
// (not Windows and Android) ASSERT: scan run java Main
// (not Windows and Android) ASSERT: scan in JavaClass Init
// (not Windows and Android) ASSERT: scan in JavaClass foo
// (not Windows and Android) ASSERT: scan in JavaClass goo
// (not Windows and Android) ASSERT: scan in I1 bar
// (not Windows and Android) ASSERT: scan in JavaClass bar
// (not Windows and Android) ASSERT: scan in JavaClass new goo
// (not Windows and Android) ASSERT: scan in JavaClass new bar
// (not Windows and Android) ASSERT: scan in CangjieInvoke Init
// (not Windows and Android) ASSERT: scan JavaClass inherit goo: 10
// (not Windows and Android) ASSERT: scan I1 bar: 1
// (not Windows and Android) ASSERT: scan JavaClass inherit bar: 100
// (not Windows and Android) ASSERT: scan JavaClass new goo: 1000
// (not Windows and Android) ASSERT: scan JavaClass new bar: 1234

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class CangjieInvoke <: JavaClass {
    public init() {
        println("in CangjieInvoke Init")
        var javaClass = JavaClass()
        var v1 = javaClass.goo(javaClass.foo())
        println("JavaClass inherit goo: ${v1}")
        var _v2 = I1.bar()
        println("I1 bar: ${_v2}")
        var v2 = JavaClass.bar()
        println("JavaClass inherit bar: ${v2}")
        var v3 = javaClass.goo()
        println("JavaClass new goo: ${v3}")
        var v4 = JavaClass.bar(1234)
        println("JavaClass new bar: ${v4}")
    }
}

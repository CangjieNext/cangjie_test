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
// (not Windows and Android) EXEC: %java %java_mirror_gen com.JavaClass_Father
// (not Windows and Android) EXEC: %java %java_mirror_gen com.I1
// (not Windows and Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) EXEC: %javac %cp_loader_jar Main.java com/*.java CangjieInvoke.java -h . -d .
// (not Windows and Android) EXEC-PIPE: %java %cp_loader_jar -Djava.library.path=. Main 2>&1 | compare %f
// (not Windows and Android) ASSERT: scan run java Main
// (not Windows and Android) ASSERT: scan-3 in JavaClass Init
// (not Windows and Android) ASSERT: scan-5 in JavaClass_Father Init
// (not Windows and Android) ASSERT: scan in JavaClass_Father foo
// (not Windows and Android) ASSERT: scan in JavaClass_Father goo
// (not Windows and Android) ASSERT: scan-2 in I1 bar
// (not Windows and Android) ASSERT: scan in JavaClass_Father bar
// (not Windows and Android) ASSERT: scan-2 in JavaClass_Father new goo
// (not Windows and Android) ASSERT: scan-2 in JavaClass_Father new bar
// (not Windows and Android) ASSERT: scan in JavaClass foo
// (not Windows and Android) ASSERT: scan in JavaClass goo
// (not Windows and Android) ASSERT: scan in JavaClass bar
// (not Windows and Android) ASSERT: scan-2 in CangjieInvoke Init
// (not Windows and Android) ASSERT: scan JavaClass_Father inherit goo: 10
// (not Windows and Android) ASSERT: scan-2 I1 bar: 1
// (not Windows and Android) ASSERT: scan JavaClass_Father inherit bar: 100
// (not Windows and Android) ASSERT: scan JavaClass_Father new goo: 1000
// (not Windows and Android) ASSERT: scan JavaClass_Father new bar: -1
// (not Windows and Android) ASSERT: scan JavaClass inherit goo: 20
// (not Windows and Android) ASSERT: scan JavaClass inherit bar: 200
// (not Windows and Android) ASSERT: scan JavaClass new goo: 1000
// (not Windows and Android) ASSERT: scan JavaClass new bar: 111

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class CangjieInvoke <: JavaClass {
    public init() {
    }

    public func test1(a: Int32) {
        println("in CangjieInvoke Init")
        var javaClass = JavaClass_Father()
        var v1 = javaClass.goo(javaClass.foo())
        println("JavaClass_Father inherit goo: ${v1}")
        var _v2 = I1.bar()
        println("I1 bar: ${_v2}")
        var v2 = JavaClass_Father.bar()
        println("JavaClass_Father inherit bar: ${v2}")
        var v3 = javaClass.goo()
        println("JavaClass_Father new goo: ${v3}")
        var v4 = JavaClass_Father.bar(a)
        println("JavaClass_Father new bar: ${v4}")
    }

    public func test2(a: Int32) {
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
        var v4 = JavaClass.bar(a)
        println("JavaClass new bar: ${v4}")
    }
}

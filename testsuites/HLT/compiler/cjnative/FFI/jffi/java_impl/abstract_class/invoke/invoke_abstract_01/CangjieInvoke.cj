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
// (not Windows and Android) ASSERT: scan in C1 init
// (not Windows and Android) ASSERT: scan in JavaClass Init
// (not Windows and Android) ASSERT: scan in C1 goo
// (not Windows and Android) ASSERT: scan in JavaClass bar
// (not Windows and Android) ASSERT: scan in C1 bar
// (not Windows and Android) ASSERT: scan in JavaClass new newoo
// (not Windows and Android) ASSERT: scan in CangjieInvoke Init
// (not Windows and Android) ASSERT: scan JavaClass goo: 66
// (not Windows and Android) ASSERT: scan JavaClass bar: 100
// (not Windows and Android) ASSERT: scan C1 bar: 1
// (not Windows and Android) ASSERT: scan JavaClass newoo: 10000

package UNNAMED

// import interoplib.interop.*
import java.lang.JObject

@JavaImpl
public class CangjieInvoke <: JavaClass {
    public init() {
        println("in CangjieInvoke Init")
        var javaClass = JavaClass()
        var v1 = javaClass.goo()
        println("JavaClass goo: ${v1}")
        var v2 = JavaClass.bar()
        println("JavaClass bar: ${v2}")
        var _v2 = C1.bar()
        println("C1 bar: ${_v2}")

        var v3 = javaClass.newoo()
        println("JavaClass newoo: ${v3}")
    }
}

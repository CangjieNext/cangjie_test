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
// (not Windows and Android) ERRCHECK: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) ASSERT: scan sema_java_interop_not_supported
// (not Windows and Android) ASSERT: scan property in abstract class

package UNNAMED

import java.lang.JObject

@JavaImpl
public class CangjieInvoke <: JObject {
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

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
// (not Windows and Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) EXEC: %javac %cp_loader_jar Main.java com/*.java TestClass.java CangjieInvoke.java -h . -d .
// (not Windows and Android) EXEC-PIPE: %java %cp_loader_jar -Djava.library.path=. Main 2>&1 | compare %f
// (not Windows and Android) ASSERT: scan run java Main
// (not Windows and Android) ASSERT: scan in JavaClass bar
// (not Windows and Android) ASSERT: scan in CangjieInvoke Init
// (not Windows and Android) ASSERT: scan in TestClass Init
// (not Windows and Android) ASSERT: scan in TestClass goo
// (not Windows and Android) ASSERT: scan testclass.goo(): 88
// (not Windows and Android) ASSERT: scan in CangjieInvoke newoo
// (not Windows and Android) ASSERT: scan testclass.newoo(): 12345
// (not Windows and Android) ASSERT: scan in TestClass bar
// (not Windows and Android) ASSERT: scan TestClass.bar(): 54321
// (not Windows and Android) ASSERT: scan JavaClass.bar(): 1

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
private class TestClass <: JavaClass {
    public init() {
        super()
        println("in TestClass Init")
    }

    public override func goo() {
        println("in TestClass goo")
        return 88i32
    }

    public static redef func bar() {
        println("in TestClass bar")
        return 54321i32
    }

    public func newoo(): Int32 {
        println("in CangjieInvoke newoo")
        return 12345
    }
}

@JavaImpl
public class CangjieInvoke <: JObject {
    public init() {
        println("in CangjieInvoke Init")
        var testclass = TestClass()
        println("testclass.goo(): ${testclass.goo()}")
        println("testclass.newoo(): ${testclass.newoo()}")
        println("TestClass.bar(): ${TestClass.bar()}")
        println("JavaClass.bar(): ${JavaClass.bar()}")
    }
}

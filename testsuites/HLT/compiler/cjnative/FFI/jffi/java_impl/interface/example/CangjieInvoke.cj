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
// (not Windows and Android) EXEC: %java %java_mirror_gen com.I
// (not Windows and Android) EXEC: %java %java_mirror_gen com.Arg
// (not Windows and Android) EXEC: %java %java_mirror_gen com.MI
// (not Windows and Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) EXEC: %javac %cp_loader_jar Main.java com/*.java CangjieInvoke.java -h . -d .
// (not Windows and Android) EXEC-PIPE: %java %cp_loader_jar -Djava.library.path=. Main 2>&1 | compare %f
// (not Windows and Android) ASSERT: scan run java Main
// (not Windows and Android) ASSERT: scan java: Hello from MI! [foo(): I]
// (not Windows and Android) ASSERT: scan java: Hello from MI! [foo(I): long]
// (not Windows and Android) ASSERT: scan java: Hello from Arg! [g(I): long]
// (not Windows and Android) ASSERT: scan static: 1
// (not Windows and Android) ASSERT: scan I.staticMethod(): 1
// (not Windows and Android) ASSERT: scan x is I: true
// (not Windows and Android) ASSERT: scan Hello from cj!

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class CangjieInvoke <: MI {
    public init() {
        println("static: ${MI.staticMethod()}") // prints "static: 1"
        let x = MI().foo().getOrThrow() // prints "java: Hello from MI! [foo(): I]"
        println("I.staticMethod(): ${I.staticMethod()}"); // prints "I.staticMethod(): 1"
        println("x is I: ${x is I}"); // prints "x is I: true"
        println(x.foo(x)); // prints "java: Hello from MI! [foo(I): long]\n1"
        Arg().g(x) // prints "java: Hello from Arg! [g(I): long]"
        println("Hello from cj!")
    }
}

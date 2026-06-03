/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (Android) DEPENDENCE: com MainInstrumentedTest.java 
// (Android) EXEC: %javac com/*.java %java_interop_util/Logger.java
// (Android) EXEC: %java %java_mirror_gen com.Inherit
// (Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f %java_interop_util/logger.cj UNNAMED/src/*.cj
// (Android) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (Android) ASSERT: scan hello world!
// (Android) EXEC: %ndk_root/bin/llvm-readelf -d ./libUNNAMED.so

package UNNAMED

import java.lang.*

@JavaImpl
public class CangjieInvoke <: Inherit {
    public init() {
        super(1)
        // super.aByte // BUG，访问的话会crash
        super.foo()
        Inherit.goo()
        Logger.println("CangjieInvoke.init")
    }
    public prop p: String {
        get() {
            "p"
        }
    }
    public prop p1: JString {
        get() {
            JString("p1")
        }
    }
    public var v0: String = "v0"
    public var v1: JString = JString("v1")
    public override func javaProtectedFunc(): Unit {
        println("CangjieInvoke.javaProtectedFunc")
    }
    public func bar(s0: String): JString {
        JString(s0)
    }
    public func bar1(s0: JString): String {
        s0.toString()
    }
    public func protectedFunc(): Int64 {
        println("CangjieInvoke.protectedFunc")
        1
    }
}

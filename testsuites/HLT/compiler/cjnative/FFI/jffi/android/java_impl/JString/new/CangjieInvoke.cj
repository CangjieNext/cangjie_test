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
// (Android) EXEC: %ndk_root/bin/llvm-readelf -d ./libUNNAMED.so
// (Android) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (Android) ASSERT: scan hello world!

package UNNAMED

import java.lang.*

// 如果创建全局变量即会导致crash
// public let x: CangjieInvoke = CangjieInvoke()

public class CangjieClass {
    public let v: CangjieInvoke = CangjieInvoke()
    public func test(): Unit {
        Logger.println("CangjieClass.test")
        this.v.simple()
    }
}

@JavaImpl
public class CangjieInvoke <: Inherit {
    public init() {
        super(1)
        // super.aByte // BUG，访问的话会crash
        super.foo()
        Inherit.goo()
        Logger.println("CangjieInvoke.init")
    }
    protected init(i: Int32) {
        super(1)
        Logger.println("CangjieInvoke.init(${i})")
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
    public func simple(): Unit {
        Logger.println("simple")
    }
    private func callLambda(f: () -> Unit): Unit {
        Logger.println("callLambda")
        f()
    }
    public func checkGlobalVar(): Unit {
        Logger.println("=== checkGlobalVar ===")
        // 当前发现如果定义全局变量将导致crash，故注释
        // x.simple()
        // x.bar("checkEscape s")
        // Logger.println(x.bar("checkEscape s").toString())
    }
    public func checkLambdaClosure(): Unit {
        Logger.println("=== checkLambdaClosure ===")
        // 检查lambda捕获@JavaImpl
        let ci = CangjieInvoke()
        let l = {
            =>
                Logger.println("lambda")
                ci.simple()
        }
        this.callLambda(l)
    }
    public func checkCangjieClass(): Unit {
        Logger.println("=== checkCangjieClass ===")
        let cc = CangjieClass()
        cc.test()
    }
    public func checkEscape(): Unit {
        Logger.println("=== checkEscape ===")
        this.checkGlobalVar()
        this.checkCangjieClass()
        this.checkLambdaClosure()
    }
}

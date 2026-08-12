// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %dumpCHIRDebug %enableO2 -Woff all %f -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %output %run_args
// (Linux) EXEC: %cat %n\_CHIR/[0-9]*_Devirtualization.chirtxt | compare %f
// (Linux) ASSERT: regex Apply\(Class-_CN7default2A1.*->@_CN7default2A1.*foo.*
// (Linux) ASSERT: regex InvokeStatic\(This&->@_CN7default1A.*foo.*
// (Linux) ASSERT: regex-not Apply\(Class-_CN7default.*A.*->@_CN7default.*bar.*
// (Linux) ASSERT: regex-not InvokeStatic\(Class-_CN7default2A1.*->@_CN7default.*bar.*
// (Linux) ASSERT: regex-not InvokeStatic\(Class-_CN7default2A1.*->@_CN7default.*foo.*

interface A<T> {
    static func foo(): T
    // bar is expected to inline to pure call to foo
    static func bar(): T {
        // virtual static call
        return foo()
    }
}

open class A1 <: A<Int64> {
    // this call to foo need to be devirtualized after bar is inlined
    public static func foo(): Int64 {
        return 1
    }
}

class A2 <: A1 {}

main() {
    A1.bar() - 1
}

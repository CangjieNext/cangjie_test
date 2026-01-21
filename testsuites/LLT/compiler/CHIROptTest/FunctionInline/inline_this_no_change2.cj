// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %dumpCHIRDebug --fchir-function-inlining -Woff all %f -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %output %run_args
// (Linux) EXEC: %cat %n\_CHIR/[0-9]*_FunctionInline.chirtxt | sed -n -r '/Func @_CN7default2C12f1.*/,/^}$/p' | compare %f
// (Linux) ASSERT: scan InvokeStatic(ThisType: This&, f1
// (Linux) ASSERT: scan InvokeStatic(ThisType: This&, f2

interface I<T> {
    static func f1(a: T): Unit

    static func f3(a: T): Unit {
        f1(a)
    }
}

open class C1 <: I<Int64> & I<String> {
    static public func f1(a: Int64): Unit {
        f1("1")
    }
    static public func f1(a: String): Unit {
        f2()
    }

    static public func f2(): Unit {}
}

open class C <: C1 {
    static public func f2(): Unit {}
}

main() {
    C.f3(1)
    0
}
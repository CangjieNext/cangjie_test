// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: static f2 in foo must bind to A<T>::f2 via InvokeStatic, not subclass C<T>::f2.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7defaultU00000004tyZkg1AIG_E3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan InvokeStatic(This&->@_CN7defaultU00000004tyZkg1AIG_E2f2Hv
// ASSERT: scan-not InvokeStatic(This&->@_CN7default1CIG_E2f2Hv
// ASSERT: scan-not Invoke(Class-_CN7default1CIG_E&->@_CN7default1CIG_E2f2Hv

let globalVar: I = A<Int64>()

interface I {
    func foo(): Unit {}
}

private open class A<T> <: I {
    init() {}
    init(a: Int64) {
        globalVar.foo()      // trigger devirtualization and generate an instance func of foo
                             // in foo f2 is called, f2's this type should be replaced to A<Int64>
    }
    public func foo(): Unit {
        f2()
    }
    static func f2(): Unit {}
}

class C<T> <: A<T> {
    static public func f2(): Unit {}
}

main() {
    A<Int64>(1)
    0 - 0
}

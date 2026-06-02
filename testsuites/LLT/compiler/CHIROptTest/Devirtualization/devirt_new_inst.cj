// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %dumpCHIRDebug %enableO2 -Woff all %f -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %output %run_args
// (Linux) EXEC: %cat %n\_CHIR/[0-9]*_Devirtualization.chirtxt | sed -n -r '/Func @_CIN7defaultU00000004tyZkg1AIG_E3fooHv\$l/,/^}$/p' | compare %f
// (Linux) ASSERT: regex Invoke.*f2
// (Linux) ASSERT: regex-not Invoke.*this.*f2

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
    0
}
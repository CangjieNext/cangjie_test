// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
// EXEC-PIPE-0: %compiler %dumpCHIRDebug %enableO2 -Woff all %f -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %output %run_args
// (Linux) EXEC: %cat %n\_CHIR/[0-9]*_Devirtualization.chirtxt | sed -n -r '/Func @_CN7default6<main>Hv/,/^}$/p' | compare %f
// (Linux) ASSERT: scan UnBox
// (Linux) ASSERT: scan Apply(ThisType: Unit, @_CN7defaultXu3fooHv
// (Linux) ASSERT: scan-not Class-_CNat3AnyE
 
interface I<T> {
    mut func foo(): Int64
    mut func bar(): Int64 {
        foo()
    }
}
 
extend Unit <: I<Int64> {
    public func foo(): Int64 {
        1
    }
}
 
main() {
    var u: Unit = ()
    // After inlining I.bar, Devirtualization rewrites Invoke(foo) to Apply(Unit.foo).
    // Wrapper this is Any&; raw Unit.foo expects Unit, so this must be UnBox'd.
    u.bar() - 1
}
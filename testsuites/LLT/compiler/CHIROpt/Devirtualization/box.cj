// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Positive: Callable locals with exact runtime types -> invoke devirtualized to Apply.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7defaultXCNY_4BaseIG_E3barHG_" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default6TargetE&->@_CN7default6Target6invokeHl
// ASSERT: scan Apply(Class-_CN7default3TamE&->@_CN7default3Tam6invokeHNNat6OptionIlE
// ASSERT: scan-not Invoke(Class-_CN7default8CallableIG_G0_E&->@_CN7default8CallableIG_G0_E6invokeHG_

interface Callable<A, R> { func invoke(a: A): R }
class Target <: Callable<Int64, Int64> { public func invoke(a: Int64): Int64 { a + 1 } }
class Tam <: Callable<?Int, ?Int> {
    public func invoke(a: ?Int): ?Int {
        match(a) {
            case Some(x) => x+1
            case None => None
        }
    }
}

interface I<T> { func bar(x: T): T }
open class Base<T> {}
extend<T> Base<T> <: I<T> {
    public func bar(x: T): T {
        let a: Callable<Int64, Int64> = Target()
        a.invoke(0)
        let b: Callable<?Int, ?Int> = Tam()
        b.invoke(3)
        return x
    }
}

func f<T>(a: I<T>, b: T): T { a.bar(b) }
main(): Int64 { f(Base<Int64>(), 42) - 42 }

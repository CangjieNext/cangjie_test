// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output %run_args > %devirFile 2>&1
// (DEBUG_OPTION)ASSERT: scan [Devirtualization] The function call to f1 at [35,5] was optimized.
// (DEBUG_OPTION)ASSERT: scan-not core dumped
// (DEBUG_OPTION)ASSERT: scan-not stack trace
// (DEBUG_OPTION)EXEC: %compiler %n.cj -o %n.nonDevir.out
// (DEBUG_OPTION)EXEC: %n.nonDevir.out > %nonDevirFile 2>&1
// (DEBUG_OPTION)EXEC: %diff %devirFile %nonDevirFile

private interface I<T> {
    func f1(a: T): Unit {
        println("I")
    }
}

private open class A {
    public open func f1(a: Int64): Unit {
        println("extend A f1")
    }
}

private class B <: A & I<Int64> {
    public override func f1(a: Int64): Unit {
        println("extend B f1")
    }
}

private func Test(i: I<Int64>) {
    i.f1(1)
}

main() {
    Test(B())
}

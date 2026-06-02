// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output %run_args > %devirFile 2>&1
// ASSERT: scan [Devirtualization] The function call to f2 at [37,5] was optimized.
// ASSERT: scan [Devirtualization] The function call to f1 at [37,10] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// (DEBUG_OPTION)EXEC: %compiler %n.cj -o %n.nonDevir.out
// (DEBUG_OPTION)EXEC: %n.nonDevir.out > %nonDevirFile 2>&1
// (DEBUG_OPTION)EXEC: %diff %devirFile %nonDevirFile

private interface I1 {
    func f1(a: Int64): Int64 {
        return 1
    }
    func f2(b: Int64): Int64 {
        return 1
    }
}

private open class B <: I1 {
    public func f1(a: Int64): Int64 {
        return a + 3
    }

    public func f2(b: Int64): Int64 {
        return b + 4
    }
}

private func Test(a: I1, c: Int64) {
    a.f2(a.f1(c))
}

main() {
    Test(B(), 2)
    0
}

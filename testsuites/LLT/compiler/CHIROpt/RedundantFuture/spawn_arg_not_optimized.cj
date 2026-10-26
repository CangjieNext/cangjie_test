// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative case: handing the Future to a call that survives inlining keeps the
// call as a user of it, so the fold is blocked. `foo` is made recursive so the
// inliner leaves it alone (recursive functions are skipped), which is what
// keeps a real Apply of `foo` in `main` rather than an inlined copy of its
// body. Folding here would hand a closure to a parameter typed Future and
// miscompile the call. Pairs with spawn_multi_optimized.cj, where an empty
// callee is inlined away before this pass runs and the same shape does fold.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantFutureOpt.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan-not executeClosure:
// ASSERT: regex-begin %(?P<closure>\d+): \(\) -> Int64 = Lambda\[
// ASSERT: regex-after %(?P<future>\d+): Class-_CNat6FutureIG_E<Int64>& = Allocate\(Class-_CNat6FutureIG_E<Int64>\)
// ASSERT: regex-after %\d+: Void = Apply\(Class-_CNat6FutureIG_E<Int64>&->@_CNat6FutureIG_E6<init>HF0G_E, %(?P=future), %(?P=closure)\)
// ASSERT: regex-after %\d+: Class-_CNat6FutureIG_E<Int64>& = Spawn\(%(?P=future)\)

func foo(a: Future<Int64>, n: Int64): Int64 {
    if (n <= 0) {
        return a.get()
    }
    return foo(a, n - 1)
}

main(): Int64 {
    let f = spawn {
        => return 7
    }
    if (foo(f, 2) == 7) {
        return 0
    }
    return 1
}

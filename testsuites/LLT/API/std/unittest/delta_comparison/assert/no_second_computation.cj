/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC-0: %run %run_opt %n.%suffix %run_utest_opt %run_args
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args --no-color 2>&1 | compare %f
// ASSERT: scan S = [true]
// ASSERT: scan-not S = [false]
// ASSERT: scan PASSED: 1, SKIPPED: 0, ERROR: 0
// ASSERT: scan FAILED: 0

class State {
    private var s = 0.0f32
    public func inc() {
        s += 1.0f32
        println("S = [${s < 1.1f32}]")
        s
    }
}

@Test
class Test_Second_Computation {
    @TestCase
    func simple(): Unit {
        let s = State()
        @Assert(s.inc() == 1.0f32, delta: 0.001f32)
    }
}

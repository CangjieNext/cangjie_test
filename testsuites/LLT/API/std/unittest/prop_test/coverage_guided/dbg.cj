/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt --sanitizer-coverage-trace-pc-guard --sanitizer-coverage-trace-compares 
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color --coverage-guided | compare %f
// ASSERT: scan with randomSeed = 42
// ASSERT: scan Assert Failed
// ASSERT: scan message = new coverage
// ASSERT: scan ty = UInt16
// ASSERT: scan lhv = 
// ASSERT: scan rhv = 
// ASSERT: scan trace is enabled
// ASSERT: scan microfuzz is initialized

import std.unittest.*
import std.unittest.prop_test.*
import std.unittest.testmacro.*

// internals of our fuzzing engine, do not try this at home!
foreign func CJ_MICROFUZZ_ENABLE_TRACE(): Unit
foreign func CJ_MICROFUZZ_DISABLE_TRACE(): Unit
foreign func CJ_MICROFUZZ_TRACE_ENABLED(): Bool
foreign func CJ_MICROFUZZ_IS_INITIALIZED(): Bool
foreign func CJ_MICROFUZZ_SET_DBG_CALLBACK(callback: CFunc<(CString, CString, UInt64, UInt64) -> Unit>): Unit

@Test[value in randomInRange(min: 1, max: 300)]
@Configure[randomSeed: 42, generationSteps: 5000]
func fooTest(value: Int16): Unit {
    if (unsafe { CJ_MICROFUZZ_IS_INITIALIZED() }) {
        println("microfuzz is initialized")
    }
    unsafe {
        CJ_MICROFUZZ_SET_DBG_CALLBACK({ message, ty, lhv, rhv =>
            println("message = ${message}")
            println("ty = ${ty}")
            println("lhv = ${lhv}")
            println("rhv = ${rhv}")
        })
    }
    unsafe { CJ_MICROFUZZ_ENABLE_TRACE() }
    if (unsafe { CJ_MICROFUZZ_TRACE_ENABLED() }) {
        println("trace is enabled")
    }


    @Assert(value != 155)
}

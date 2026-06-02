/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan --- PASSED ---

import std.mock_test_util.*
import std.unittest.*
import std.collection.*

class C {
    public func c(_: String): Array<Int64> {
        throw Exception("Not implemented")
    }
}

class B {
    public func b(): C {
        throw Exception("Not implemented")
    }
}

// invetigate CJNATIVE failure with Array<R> as a return type
func g<R>(stubCall: () -> R): ArrayList<R> {
    ArrayList([stubCall()])
}

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let testData: Array<Int64> = []

        let b = unsafe { createMock<B>(dummyMockingCallHandler) }
        let c = unsafe { createMock<C>(dummyMockingCallHandler) }
        g {=> testData}
        println("--- PASSED ---")
    }
}

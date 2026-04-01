/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt 

@Test
class ExclusiveScopeTest {
    @TestCase
    func testExclusiveScopeBasic(): Unit {
        let result = exclusiveScope<Int64> {
            return 42
        }
        @Expect(result, 42)
    }
    
    @TestCase
    func testExclusiveScopeWithException(): Unit {
        var exceptionThrown = false
        try {
            let _ = exclusiveScope<Int64> {
                throw Exception("test exception")
            }
        } catch (e: ExclusiveScopeException) {
            exceptionThrown = true
        }
        @Expect(exceptionThrown, true)
    }
    
    @TestCase
    func testExclusiveScopeWithString(): Unit {
        let result = exclusiveScope<String> {
            return "hello world"
        }
        @Expect(result, "hello world")
    }
}

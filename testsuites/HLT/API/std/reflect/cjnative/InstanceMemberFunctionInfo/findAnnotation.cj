/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt %compile_library -p ./MyType/src/myType -o libMyType_myType.%test_suffix
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt -o %output %f --import-path . -L. -lMyType_myType %cmp_utest_opt
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC: %run %run_opt %output %run_args %run_utest_opt

import std.reflect.*
import MyType.myType.*

@Test
class Test {
    @TestCase
    func testC1(): Unit {
    }
    @TestCase
    func testS1(): Unit {
    }
    @TestCase
    func testA1(): Unit {

        // 泛型导致的。
        // ???
    }
    @TestCase
    func testI1(): Unit {
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.process.*

@Test
class Test_currentprocess_homedirectory_01 {
    @TestCase
    func test_currentprocess_homedirectory_01(): Unit {
        let curProcess: CurrentProcess = Process.current
        let curProcess1: CurrentProcess = Process.current
        @Expect(curProcess.homeDirectory.toString().size > 0 , true)
        @Expect(curProcess.homeDirectory.toString(), curProcess1.homeDirectory.toString())
    }
}

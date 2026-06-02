/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./tsv01.tsv
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE-1: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan IllegalStateException

import std.collection.*
import stdx.unittest.data.*

@Test
public class Test_Tsv_Reader {
    @TestCase[person in tsv("tsv01.tsv", header: [ "newname" ])]
    func test01(person: HashMap<String, String>): Unit {
    }
}

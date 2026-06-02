/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class T {
    @TestCase
    func playground(): Unit {
        println("this is playground")
    }
}

main(): Int64 {
    let info = T().asTestSuite().runTests()
    if (info.errorCount != 0) {
        return -1
    }
    if (info.caseCount != 1) {
        return -2
    }
    if (info.passedCount != 1) {
        return -3
    }
    if (info.failedCount != 0) {
        return -4
    }
    if (info.skippedCount != 0) {
        return -5
    }
    return 0
}

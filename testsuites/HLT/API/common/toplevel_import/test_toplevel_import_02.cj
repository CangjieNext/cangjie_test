/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows)EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// (not Windows)RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.*
import stdx.crypto.*
import stdx.compress.*
import stdx.encoding.*
import stdx.net.*
import stdx.log.*
import stdx.logger.*
import stdx.serialization.*
import std.math.numeric.*

@Test
class Test_toplevel_import_01 {
    @TestCase
    func test_toplevel_import_01(): Unit {
        println("cangjie")
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.sync.*
import std.time.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*

var sum = 0
var sum1 = 0
var sum2 = 0
var port = AtomicUInt16(0)

@Test
class Test_tlssocketconf_02 {
    public override func beforeEach(): Unit {
        sum = 0
        port = AtomicUInt16(0)
    }

    @TestCase
    func test_01(): Unit {
        //client certificates path error.
        try {
            String.fromUtf8(readToEnd(File("./root_ecdsa.cer", Read)))
        } catch (e: FSException) {
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_02(): Unit {
        //server certificates path error.
        try {
            String.fromUtf8(readToEnd(File("./end_ecdsa.cer", Read)))
        } catch (e: FSException) {
            @Expect(e.message.contains("does not exist or permission denied"))
            sum += 1
        }
        @Expect(sum, 1)
    }
}

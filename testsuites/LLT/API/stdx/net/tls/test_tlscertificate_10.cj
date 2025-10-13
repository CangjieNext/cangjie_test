/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.common.*
import std.sync.*
import std.time.*
import std.argopt.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test_tlscertificate_10 {
    @TestCase
    func test_05(): Unit {
        //pem format key.
        let pemData = String.fromUtf8(File.readFrom("./files/root_ecdsa_error.txt"))
        var sum = 0
        try {
            let pemFormat = Pem.decode(pemData)
        } catch (e: Exception) {
            sum += 1
        }
        @Expect(sum, 1)
    }
}

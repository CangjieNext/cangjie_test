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
import stdx.crypto.x509.*
import std.sync.*
import std.time.*
import std.argopt.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*

@Test
class Test_PEM {
    let text = String.fromUtf8(readToEnd(File("./files/client_private_key_taibai.key", Read)))
    @TestCase
    func test_01(): Unit {
        let pem = Pem.decode(text)
        @Expect(pem.toString(), PemEntry.LABEL_RSA_PRIVATE_KEY)
    }
}

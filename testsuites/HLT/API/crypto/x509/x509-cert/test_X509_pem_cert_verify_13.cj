/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.fs.File
import stdx.crypto.x509.*
import stdx.crypto.common.*
import stdx.crypto.keys.*
import std.time.DateTime

var sum = 0

@Test
class Test_X509_pem_cert_verify_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    let derData = DerBlob(File.readFrom("./data/root.der"))
    let derrootx509 = X509Certificate.decodeFromDer(derData)
    let derData1 = DerBlob(File.readFrom("./data/middle.der"))
    let dermiddlex509 = X509Certificate.decodeFromDer(derData1)
    let derData2 = DerBlob(File.readFrom("./data/server.der"))
    let derserverx509 = X509Certificate.decodeFromDer(derData2)

    @TestCase
    func test_certverify_01(): Unit {
        var opt = VerifyOption()
        opt.roots = [derrootx509]
        opt.intermediates = [dermiddlex509]
        let res = derserverx509.verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_time_02(): Unit {
        var opt = VerifyOption()
        opt.roots = [derrootx509]
        opt.intermediates = [dermiddlex509]
        opt.time = DateTime.of(year: 2023, month: 9, dayOfMonth: 21)
        let res = derserverx509.verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_time_03(): Unit {
        var opt = VerifyOption()
        opt.roots = [derrootx509]
        opt.intermediates = [dermiddlex509]
        opt.time = DateTime.of(year: 2024, month: 9, dayOfMonth: 22)
        let res = derserverx509.verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_time_04(): Unit {
        var opt = VerifyOption()
        opt.roots = [derrootx509]
        opt.intermediates = [dermiddlex509]
        opt.time = DateTime.of(year: 2024, month: 7, dayOfMonth: 1)
        let res = derserverx509.verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_dns_05(): Unit {
        var opt = VerifyOption()
        opt.roots = [derrootx509]
        opt.intermediates = [dermiddlex509]
        opt.dnsName = "*.useye.cn"
        let res = derserverx509.verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_dns_06(): Unit {
        var opt = VerifyOption()
        opt.roots = [derrootx509]
        opt.intermediates = [dermiddlex509]
        opt.dnsName = "*.52sexy.net"
        let res = derserverx509.verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_dns_07(): Unit {
        var opt = VerifyOption()
        opt.roots = [derrootx509]
        opt.intermediates = [dermiddlex509]
        opt.dnsName = "52sexy.net"
        let res = derserverx509.verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_root_07(): Unit {
        var opt = VerifyOption()
        opt.intermediates = [dermiddlex509]
        let res = derserverx509.verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_middle_08(): Unit {
        var opt = VerifyOption()
        opt.roots = [derrootx509]
        let res = derserverx509.verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_root_09(): Unit {
        var opt = VerifyOption()
        opt.roots = Array<X509Certificate>()
        let res = derserverx509.verify(opt)
        @Expect(res, false)
    }
}

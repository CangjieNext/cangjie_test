/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.File
import stdx.crypto.x509.*
import std.time.DateTime

var sum = 0

@Test
class Test_X509_pem_cert_verify_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    let pemData = String.fromUtf8(File.readFrom("./data/root.crt"))
    let pemrootx509 = X509Certificate.decodeFromPem(pemData)
    let pemData1 = String.fromUtf8(File.readFrom("./data/middle.crt"))
    let pemmiddlex509 = X509Certificate.decodeFromPem(pemData1)
    let pemData2 = String.fromUtf8(File.readFrom("./data/server.crt"))
    let pemserverx509 = X509Certificate.decodeFromPem(pemData2)
    let pemData3 = String.fromUtf8(File.readFrom("./data/middle-chain.crt"))
    let pemmidchainx509 = X509Certificate.decodeFromPem(pemData3)

    @TestCase
    func test_certverify_01(): Unit {
        var opt = VerifyOption()
        opt.roots = pemrootx509
        opt.intermediates = pemmiddlex509
        let res = pemserverx509[0].verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_time_02(): Unit {
        var opt = VerifyOption()
        opt.roots = pemrootx509
        opt.intermediates = pemmiddlex509
        opt.time = DateTime.of(year: 2023, month: 9, dayOfMonth: 21)
        let res = pemserverx509[0].verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_time_03(): Unit {
        var opt = VerifyOption()
        opt.roots = pemrootx509
        opt.intermediates = pemmiddlex509
        opt.time = DateTime.of(year: 2024, month: 9, dayOfMonth: 22)
        let res = pemserverx509[0].verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_time_04(): Unit {
        var opt = VerifyOption()
        opt.roots = pemrootx509
        opt.intermediates = pemmiddlex509
        opt.time = DateTime.of(year: 2024, month: 7, dayOfMonth: 1)
        let res = pemserverx509[0].verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_dns_05(): Unit {
        var opt = VerifyOption()
        opt.roots = pemrootx509
        opt.intermediates = pemmiddlex509
        opt.dnsName = "*.useye.cn"
        let res = pemserverx509[0].verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_dns_06(): Unit {
        var opt = VerifyOption()
        opt.roots = pemrootx509
        opt.intermediates = pemmiddlex509
        opt.dnsName = "*.52sexy.net"
        let res = pemserverx509[0].verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_dns_07(): Unit {
        var opt = VerifyOption()
        opt.roots = pemrootx509
        opt.intermediates = pemmiddlex509
        opt.dnsName = "52sexy.net"
        let res = pemserverx509[0].verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_root_08(): Unit {
        var opt = VerifyOption()
        opt.intermediates = pemmiddlex509
        let res = pemserverx509[0].verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_middle_09(): Unit {
        var opt = VerifyOption()
        opt.roots = pemrootx509
        let res = pemserverx509[0].verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_root_10(): Unit {
        var opt = VerifyOption()
        opt.roots = Array<X509Certificate>()
        let res = pemserverx509[0].verify(opt)
        @Expect(res, false)
    }

    @TestCase
    func test_certverify_middle_chain_11(): Unit {
        var opt = VerifyOption()
        opt.roots = pemrootx509
        opt.intermediates = [pemmidchainx509[1]]
        let res = pemserverx509[0].verify(opt)
        @Expect(res, false)
    }
}

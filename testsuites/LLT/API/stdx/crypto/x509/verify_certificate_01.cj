/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.fs.File
import stdx.crypto.x509.*
import std.time.DateTime

@Test
class Test_X509_certificate_pemformat {
    // 2 server certs
    var certs = Array<X509Certificate>()
    // 2 root certs
    var roots = Array<X509Certificate>()
    // 3 middle certs
    var middles = Array<X509Certificate>()

    func getX509Cert(path: String) {
        let pem = String.fromUtf8(File.readFrom(path))
        X509Certificate.decodeFromPem(pem)
    }

    /**
     * The relation of certs.
     *    root[0]         root[1]
     *    /      \            |
     *  mid[0]  mid[1]    mid[2]
     *   |                  |
     *  server[0]         server[1]
     */
    public override func beforeEach(): Unit {
        certs = getX509Cert("./files/servers.crt")
        roots = getX509Cert("./files/roots.crt")
        middles = getX509Cert("./files/middles.crt")
    }

    // Verify by time is ok
    @TestCase
    func test_verify_by_time_01(): Unit {
        var opt = VerifyOption()
        opt.roots = roots
        opt.intermediates = middles
        let res = certs[0].verify(opt)
        @Expect(res, true)
    }

    // Verify by time fail 
    @TestCase
    func test_verify_by_time_02(): Unit {
        var opt = VerifyOption()
        opt.roots = roots
        opt.intermediates = middles
        opt.time = DateTime.of(year: 2023, month: 7, dayOfMonth: 1)
        let res = certs[0].verify(opt)
        @Expect(res, false)
    }

    // Verify by dns fail 
    @TestCase
    func test_verify_by_dns(): Unit {
        var opt = VerifyOption()
        opt.dnsName = "www.example.com"
        let res = certs[0].verify(opt)
        @Expect(res, false)
    }

    // cert0 <- root0: false
    @TestCase
    func test_verify_by_chain_01(): Unit {
        var opt = VerifyOption()
        opt.roots = [roots[0]]
        opt.intermediates = []
        let res = certs[0].verify(opt)
        @Expect(res, false)
    }
    // cert0 <- middle0 <- root0: true
    @TestCase
    func test_verify_by_chain_02(): Unit {
        var opt = VerifyOption()
        opt.roots = [roots[0]]
        opt.intermediates = [middles[0]]
        let res = certs[0].verify(opt)
        @Expect(res, true)
    }
    // cert0 <- (middle0, middle1, middle2) <- (root0, root1) : true
    @TestCase
    func test_verify_by_chain_03(): Unit {
        var opt = VerifyOption()
        opt.roots = roots
        opt.intermediates = middles
        let res = certs[0].verify(opt)
        @Expect(res, true)
    }
    // cert1 <- middle0 <- root0: false
    @TestCase
    func test_verify_by_chain_04(): Unit {
        var opt = VerifyOption()
        opt.roots = [roots[0]]
        opt.intermediates = [middles[0]]
        let res = certs[1].verify(opt)
        @Expect(res, false)
    }
    // cert1 <- middle2 <- root1: true
    @TestCase
    func test_verify_by_chain_05(): Unit {
        var opt = VerifyOption()
        opt.roots = [roots[0]]
        opt.intermediates = [middles[1]]
        let res = certs[1].verify(opt)
        @Expect(res, true)
    }
    // cert1 <- (middle0, middle1, middle2) <- (root0, root1) : true
    @TestCase
    func test_verify_by_chain_06(): Unit {
        var opt = VerifyOption()
        opt.roots = roots
        opt.intermediates = middles
        let res = certs[1].verify(opt)
        @Expect(res, true)
    }
}

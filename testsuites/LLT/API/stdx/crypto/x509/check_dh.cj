/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import std.fs.*
import stdx.crypto.x509.*
import stdx.net.tls.*

var sum = 0

@Test
class Test_der_verify_DH_01 {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase[x in [ "./files/ca.cer",
 "./files/ca_public_key.pem", "./files/certsign.der" ]]
    func test_verify_dh(x: String): Unit {
        let derData = DerBlob(File.readFrom(x))
        try{
            let _ = DHParameters.decodeDer(derData)
            @Assert(false)
        } catch (e: X509Exception) {
            @Expect(e.message.contains("Failed to load"))
        }
    }

    @TestCase
    func test_verify_dh_succ(): Unit {
        let pemString = """
-----BEGIN DH PARAMETERS-----
MIICCAKCAgEAiKhNDBVs1y9KEyybCDCmQdNmFhLAQ3znopl40E8idcAIG9NyDVcI
XLOtsXwHWbZNF+2b7Mz/+aOcLURsPZTcnME/1jb2g0tWI2OQI6PvaPPGWBVK4hrr
ekdb7YfAge0qG3ajrIdQAcqbvvRDL3cj1+7cYtUFgZvTWxBC2k6hqP3qa4nZsWaQ
rlaNZ995fahXGjMCW968zabwAS9uV9vkTF1/BLB+QIxg20F7HuXuTEiMaC5jD3ZP
366HAjki2R+oFubBFqhCsjxgn3DIVYsEIa0l0LZKSO38W/1SlrmZEum5UIeSHbft
Z9S3gSjUE583kSBlMCLpe2VSgUuVV/+I3yIy8PM9yQajdlMcN3GJ0Mbgi59fvc1j
jxW0YQtCWipay2wKuY0ioahh7EHFmr4IXMiqVFH18p8UM9AwT2Zt7j9a4Tmt8AGe
in0wen1nJvCViP9lXl1rD0g54yiL0yrx+PuIQWIZC44xy/2d+PXGZETG15XPPR5z
qRtGPfD/ul+R3d7O1khU7IyP51a0/X6/KtGAuH9xq/gpFOYkihfgJI2JObx0I7Uq
hO0wAt29/EVTsPSA+s52UAQDNsmLO6l/N+4VaKCClYpI80pIaRdjq8krzlY9HRmW
P4+4EkB+G/2N5zz4vKsGCwBhpUC109TBSQIQiA1p9pUhRr22J05+4yMCAQU=
-----END DH PARAMETERS-----
"""
        let dh  = DHParameters.decodeFromPem(pemString)
        dh.encodeToPem()
        @Expect(dh.toString(), "DHParameters(524 bytes)")
    }

    @TestCase
    func test_verify_dh_empty(): Unit {
        let derData = DerBlob(Array<Byte>())
        try{
            let _ = DHParameters.decodeDer(derData)
            @Assert(false)
        } catch (e: X509Exception) {
        }
    }
}

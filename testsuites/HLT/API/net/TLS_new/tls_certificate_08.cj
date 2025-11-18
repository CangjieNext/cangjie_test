/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,PemEntry,DerBlob,Pem,PrivateKey}
//import stdx.crypto.common.*
//import stdx.crypto.keys.*
import std.sync.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

var sum = 0

@Test
class Test_tlscertificate_08 {
    public override func beforeEach(): Unit {
        sum = 0
    }
    func parsePem(text: String): (Array<X509Certificate>, PrivateKey) {
        let pem = Pem.decode(text)
        let chain = pem |>
            filter<PemEntry> { entry => entry.label == PemEntry.LABEL_CERTIFICATE } |>
            map<PemEntry, X509Certificate> { entry => X509Certificate.decodeFromDer(entry.body.getOrThrow()) } |>
            collectArray
        let key = (pem |>
            filter<PemEntry> { entry => entry.label == PemEntry.LABEL_PRIVATE_KEY } |>
            map<PemEntry, PrivateKey> { entry => PrivateKey.decodeDer(entry.body.getOrThrow())} |>
            first) ?? throw Exception("No private key found in the PEM file")
        if (chain.isEmpty()) {
            throw Exception("No certificates found in the PEM file")
        }
        return (chain, key)
    }
    @TestCase
    func test_01(): Unit {
        //pem format pemEntry contain crt and key .
        let pem = String.fromUtf8(File.readFrom("./data/end_rsa_cer_key.pem"))
        let (certificate, privatekey) = parsePem(pem)
        @Expect(privatekey.toString(), "PrivateKey(1794 bytes, RSA 3072 bits)")
    }

    @TestCase
    func test_02(): Unit {
        //pem format of pemEntry.
        let Derdata = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        let pementry = PemEntry("CERTIFICATE", Derdata)
        let expect = ##"-----BEGIN CERTIFICATE-----
MIICNzCCAd2gAwIBAgIUabcEHZg5WhGzHWtMIEgQsnjLUY4wCgYIKoZIzj0EAwIw
cTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoGA1UE
CgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcNAQkB
FhB5b3VyZW1haWxAcXEuY29tMB4XDTIzMDIyNDA4NTcwMVoXDTMzMDIyMTA4NTcw
MVowcTELMAkGA1UEBhMCQ04xCzAJBgNVBAgMAkdEMQswCQYDVQQHDAJTWjEMMAoG
A1UECgwDQ09NMQwwCgYDVQQLDANOU1AxCzAJBgNVBAMMAkNBMR8wHQYJKoZIhvcN
AQkBFhB5b3VyZW1haWxAcXEuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE
usJH2auIkLirV2xv3h6J1hALqEWYrEAthfn3QAysy3hG70wzwnFAh/b4vu6+IYHJ
MwC0yKKywliroW17mBIzRqNTMFEwHQYDVR0OBBYEFCMNa0YR2aTTeCKenh/lduuV
/EtiMB8GA1UdIwQYMBaAFCMNa0YR2aTTeCKenh/lduuV/EtiMA8GA1UdEwEB/wQF
MAMBAf8wCgYIKoZIzj0EAwIDSAAwRQIgcbHwpCaGa4F8U9tUIQDamNR00d8w6ack
9K/fdXN/AzMCIQDNHUoqFjmFf2l2uRlzvL699Q9Wot2ovFTwrqIdbVr6Rg==
-----END CERTIFICATE-----
"##
        @Expect(pementry.toString(), "PEM CERTIFICATE (571 bytes)")
        @Expect(pementry.encode(), expect)
    }

    @TestCase
    func test_03(): Unit {
        //pem format of pemEntry with header.
        let Derdata = DerBlob(File.readFrom("./data/root_ecdsa.der"))
        let pementry = PemEntry("CERTIFICATE", [("123", "456")], Derdata)
        @Expect(pementry.toString(), "PEM CERTIFICATE (571 bytes)")
        @Expect(pementry.header("123").next().getOrThrow(), "456")
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files ./fault
// EXEC: %clang %clang_shared_opt -o ./fault/libcr17fault.so ./fault/cr17_i2d_fault.c -ldl && %clang -c -o ./fault/cr17_faultctl.o ./fault/cr17_faultctl.c && ar rcs ./fault/libcr17faultctl.a ./fault/cr17_faultctl.o && %compiler  %import-cangjie-stdx  -L./fault -lcr17faultctl %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path LD_PRELOAD=./fault/libcr17fault.so %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.fs.*
import std.time.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.crypto.common.*

/*
 * Regression test for the FFI return-width mismatch of the x509 DER encoders.
 *
 * The Cangjie foreign declarations of DYN_CJGetCertLen / DYN_CJGetX509ReqDer
 * claimed an Int64 return while the native implementations return a C int.
 * When OpenSSL's i2d_X509 / i2d_X509_REQ fail, they return -1, which was
 * misread through the 64-bit declaration as 4294967295, bypassing the
 * negative-value guard and driving a ~4 GiB Array<Byte> allocation
 * (OutOfMemoryError) instead of the intended X509Exception.
 *
 * The fault injector (./fault/cr17_crypto_shim.c) is a libcrypto shim that
 * the stdx dynamicLoader picks up through the STDX_OPENSSL_CRYPTO_FILE
 * environment variable (see the RUN-EXEC line). It makes the encoders return
 * their documented error value -1 on demand (armed via CR17SetI2DX509Fault /
 * CR17SetI2DX509ReqFault), so the tests assert the compliant behaviour: the
 * failure must surface as X509Exception.
 */

foreign func CR17SetI2DX509Fault(armed: Int32): Unit

foreign func CR17SetI2DX509ReqFault(armed: Int32): Unit

@Test
class Test_x509_ffi_int_width {
    let parentCertPem = String.fromUtf8(File.readFrom("./files/RootCACert.pem"))
    let parentCert = X509Certificate.decodeFromPem(parentCertPem)[0]
    let parentKeyPem = String.fromUtf8(File.readFrom("./files/RootCAKey.pem"))
    let parentPrivateKey = GeneralPrivateKey.decodeFromPem(parentKeyPem)
    let userKeyPem = String.fromUtf8(File.readFrom("./files/end_rsa_private_key.pem"))
    let userPrivateKey = GeneralPrivateKey.decodeFromPem(userKeyPem)
    let ip: IP = [8u8, 8u8, 8u8, 8u8]

    public override func beforeEach(): Unit {
        unsafe {
            CR17SetI2DX509Fault(0)
            CR17SetI2DX509ReqFault(0)
        }
    }

    public override func afterEach(): Unit {
        unsafe {
            CR17SetI2DX509Fault(0)
            CR17SetI2DX509ReqFault(0)
        }
    }

    private func createSignedCertificate(): X509Certificate {
        let userPublicKey = RSAPublicKey(RSAPrivateKey(2048))
        let subjectName = X509Name(
            countryName: "CN",
            provinceName: "beijing",
            localityName: "haidian",
            organizationName: "organization",
            commonName: "cr17_width_test"
        )
        let startTime = DateTime.now()
        let certInfo = X509CertificateInfo(
            serialNumber: SerialNumber(length: 20),
            notBefore: startTime,
            notAfter: startTime.addYears(1),
            subject: subjectName,
            dnsNames: ["cr17.example.com"],
            IPAddresses: [ip]
        )
        return X509Certificate(certInfo, parent: parentCert, publicKey: userPublicKey,
            privateKey: parentPrivateKey)
    }

    @TestCase
    func test_certificate_creation_normal_path(): Unit {
        let cert = createSignedCertificate()
        @Expect(cert.encodeToDer().size > 0, true)
    }

    @TestCase
    func test_csr_creation_normal_path(): Unit {
        let csrInfo = X509CertificateRequestInfo(
            subject: X509Name(
                countryName: "CN",
                provinceName: "beijing",
                localityName: "haidian",
                organizationName: "organization",
                commonName: "cr17_width_test"
            ),
            dnsNames: ["cr17.example.com"]
        )
        let csr = X509CertificateRequest(userPrivateKey, certificateRequestInfo: csrInfo,
            signatureAlgorithm: SHA256WithRSA)
        @Expect(csr.encodeToDer().size > 0, true)
    }

    @TestCase
    func test_i2d_x509_error_surfaces_as_x509_exception(): Unit {
        unsafe { CR17SetI2DX509Fault(1) }
        var gotX509Exception = false
        var wrongOutcome = ""
        try {
            let cert = createSignedCertificate()
            wrongOutcome = "certificate created without exception"
        } catch (e: X509Exception) {
            gotX509Exception = true
        } catch (e: Exception) {
            wrongOutcome = "unexpected exception: ${e.message}"
        } catch (e: Error) {
            wrongOutcome = "unexpected error: ${e.message}"
        }
        @Expect(gotX509Exception, true)
        @Expect(wrongOutcome, "")
    }

    @TestCase
    func test_csr_i2d_x509_req_error_surfaces_as_x509_exception(): Unit {
        unsafe { CR17SetI2DX509ReqFault(1) }
        let csrInfo = X509CertificateRequestInfo(
            subject: X509Name(
                countryName: "CN",
                provinceName: "beijing",
                localityName: "haidian",
                organizationName: "organization",
                commonName: "cr17_width_csr"
            ),
            dnsNames: ["cr17.example.com"]
        )
        var gotX509Exception = false
        var wrongOutcome = ""
        try {
            let csr = X509CertificateRequest(userPrivateKey, certificateRequestInfo: csrInfo,
                signatureAlgorithm: SHA256WithRSA)
            wrongOutcome = "csr created without exception"
        } catch (e: X509Exception) {
            gotX509Exception = true
        } catch (e: Exception) {
            wrongOutcome = "unexpected exception: ${e.message}"
        } catch (e: Error) {
            wrongOutcome = "unexpected error: ${e.message}"
        }
        @Expect(gotX509Exception, true)
        @Expect(wrongOutcome, "")
    }
}

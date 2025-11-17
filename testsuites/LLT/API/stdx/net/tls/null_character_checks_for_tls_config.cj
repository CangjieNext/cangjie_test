/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.fs.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.sync.*
import std.time.*
import std.argopt.*
import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*

var sum = 0
var port = AtomicUInt16(0)
var tcpser = Option<TcpServerSocket>.None
var tlsser = Option<TlsSocket>.None

@Test
class Test_tlsclientconf_07 {
    public override func beforeEach(): Unit {
        port = AtomicUInt16(0)
    }

    @TestCase
    func test_01(): Unit {
        func startServerHandshake(): Unit {
            var sum = 0
            let pem0 = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
            let pem02 = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
            var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))

            try {
                serverConf.cipherSuitesV1_2 = ["\0"]
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("The TLS config property (cipherSuitesV1_2) cannot contain null character"))
                sum += 1
            }
            try {
                serverConf.cipherSuitesV1_3 = ["\0"]
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("The TLS config property (cipherSuitesV1_3) cannot contain null character"))
                sum += 1
            }
            try {
                serverConf.supportedAlpnProtocols = ["\0"]
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("The TLS config property (supportedAlpnProtocols) cannot contain null character"))
                sum += 1
            }

            @Expect(sum == 6)
        }
        sleep(Duration.millisecond * 100)
        var clientConf = TlsClientConfig()
        var sum = 0

        try {
            clientConf.domain = "\0"
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("The TLS config property (domain) cannot contain null character"))
            sum += 1
        }
        try {
            clientConf.alpnProtocolsList = ["\0"]
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("The TLS config property (alpnProtocolsList) cannot contain null character"))
            sum += 1
        }

        println(sum)
        @Expect(sum == 2)
    }
}

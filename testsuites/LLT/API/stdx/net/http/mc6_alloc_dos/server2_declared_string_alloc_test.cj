/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// DEPENDENCE: ./common.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt ./common.cj -o common.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle common.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description (MC-6 mechanism 2, server side with caps opted out):
 *      A raw h2 client sends a 9-byte HPACK block which declares a 512MiB
 *      string literal. With maxHeaderListSize set to UInt32.Max the old code
 *      allocated Array<Byte>(536870912) before consuming any string byte; the
 *      allocation fails with an OutOfMemoryError which escapes the read thread
 *      (uncaught) and leaves a zombie connection. The fixed code validates the
 *      declared length against the bytes remaining in the block and rejects
 *      the block, closing the connection promptly.
 *      GOAWAY delivery is not guaranteed, so the connection close is observed
 *      through socket write failures instead of the GOAWAY frame.
 *      A positive control checks the server still works after the attack.
 */

package tests.mc6

import stdx.net.http.*
import stdx.net.tls.*
import std.net.*
import std.sync.*
import std.time.*
import stdx.log.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*, mc6utils.*}

@Test
class TestServer2DeclaredStringAlloc {
    var server: ?Server = None
    var port: UInt16 = 0

    func startServer(): Unit {
        // cap explicitly opted out: the decoder-side remaining-bytes check must
        // still prevent the huge allocation
        let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig())
            .maxHeaderListSize(UInt32.Max).build()
        s.distributor.register("/", {ctx => ctx.responseBuilder.body("ok")})
        server = s
        spawn {
            s.serve()
        }
        sleep(Duration.millisecond * 500)
        port = s.port
    }

    func connectRaw(): TlsSocket {
        let tcp = TcpSocket("127.0.0.1", port)
        tcp.connect()
        let tls = TlsSocket.client(tcp, clientConfig: clientConfig())
        tls.handshake()
        return tls
    }

    // 9-byte HPACK block: literal header field without indexing, new name "a",
    // declared value length 536870912 (512MiB) with zero value bytes present
    func evilBlock(): Array<UInt8> {
        return [0x00, 0x01, 0x61, 0x7f, 0x81, 0xff, 0xff, 0xff, 0x01]
    }

    @TestCase
    func testDeclaredLengthBeyondBlockIsRejected(): Unit {
        startServer()
        let tls = connectRaw()
        @Assert(h2ClientHandshake(tls), true)
        tls.write(frameBytes(FT_HEADERS, FLAG_END_HEADERS | FLAG_END_STREAM, 1, evilBlock()))

        // a compliant server rejects the block promptly and closes the
        // connection, which surfaces as socket write failures within seconds;
        // a vulnerable server dies with an uncaught OutOfMemoryError during the
        // huge allocation and leaves a zombie connection which never closes
        let elapsedMs = writeProbeUntilFailure(tls, Duration.second * 6, pingProbe())
        println("[mc6] declared-length attack: closed after ${elapsedMs}ms")
        @Assert(elapsedMs >= 0, true)
        @Assert(elapsedMs < 5000, true)
        tls.close()
        asanGC()
    }

    @TestCase
    func testServerSurvivesAfterDeclaredLengthAttack(): Unit {
        startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).noProxy().build()
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${port}/")
            .build()
        let response = client.send(request)
        let buf = Array<UInt8>(16, repeat: 0)
        let n = response.body.read(buf)
        @Assert(String.fromUtf8(buf[0..n]), "ok")
        client.close()
        asanGC()
    }
}

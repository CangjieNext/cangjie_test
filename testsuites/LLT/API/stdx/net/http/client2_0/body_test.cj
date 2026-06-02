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
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *
 * Test API:
 *
 */

package tests.client2_0

import stdx.net.http.*
import stdx.log.*
import std.io.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.random.*
import std.time.*
import std.net.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestBody {
    let client = ClientBuilder().tlsConfig(clientConfig()).build()
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
    let rawBody = Array<UInt8>(20 * 1024 * 1024, repeat: 1)

    @TestCase
    func testRawBody(): Unit {
        startServer()
        client.logger.level = LogLevel.TRACE
        sleep(Duration.second)
        let req = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/hd1")
            .body("hello")
            .build()
        let resp = client.send(req)
        let buf = Array<UInt8>(128, repeat: 0)
        let len = resp.body.read(buf)
        @Assert(buf[..len], "\"~!@#$%^&*()_+`1234567890-=,./;'[]<>?:{}|\"".toArray())
        println("raw body ok")
    }

    @TestCase
    func testRandomBody(): Unit {
        let req = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/hd2")
            .body(RandomBody())
            .build()
        let resp = client.send(req)
        let buf = Array<UInt8>(128, repeat: 0)
        for (_ in 0..10) {
            let len = resp.body.read(buf)
            if (len <= 0) {
                break
            }
        }
        println("random body ok")
    }

    @TestCase
    func testAbortBody(): Unit {
		let req = HttpRequestBuilder()
			.version(HTTP2_0)
			.url("https://127.0.0.1:${server.port}/hd2")
			.body(RandomBody())
			.build()
		let resp = client.send(req)
		let buf = Array<UInt8>(128, repeat: 0)
		resp.close()
 
		println("close body ok")
        client.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.logger.level = LogLevel.TRACE
        server
            .distributor
            .register("/hd1", {ctx => ctx.responseBuilder.body("\"~!@#$%^&*()_+`1234567890-=,./;'[]<>?:{}|\"")})
        server.distributor.register("/hd2", {ctx => ctx.responseBuilder.body(RandomBody())})
        spawn {
            server.serve()
        }
    }
}

class RandomBody <: InputStream {
    var cnt = AtomicInt64(0)
    let random = Random()

    public func read(buf: Array<UInt8>): Int64 {
        if (cnt.load() >= 10) {
            return 0
        }
        for (i in 0..buf.size) {
            buf[i] = random.nextUInt8()
        }
        cnt.fetchAdd(1)
        return buf.size
    }
}

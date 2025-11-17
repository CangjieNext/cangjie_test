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
 *      1. Server should correctly parse request, which contains only header
 *      2. Server should correctly parse request, which contains header and body
 *      3. Server should correctly parse request, which contains header, body and trailer
 *      4. Server should correctly parse request, which contains header and trailer
 *
 * Test API: public class Server {
 *      public func serve(): Unit
 * }
 */
package tests.server2_0

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import std.time.*
import stdx.log.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestParseRequest {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()
    let client = ClientBuilder().tlsConfig(clientConfig()).build()

    let headerStr = "[trailer: [t1,t2,t3], user-agent: [CANGJIEUSERAGENT_2_0]]"
    let bodyStr = "first block, second block."
    let bodyStr1 = "first block"
    let bodyStr2 = ", second block."
    let trailerStr = "[t1: [v1], t2: [v2]]"

    @TestCase
    func header(): Unit {
        startServer()
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/header")
            .header("trailer", "t1,t2,t3")
            .build()
        let _ = client.send(request)
    }

    @TestCase
    func headersRawBody(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/headersRawBody")
            .header("trailer", "t1")
            .header("trailer", "t2,t3")
            .body(bodyStr)
            .build()
        let _ = client.send(request)
    }

    @TestCase
    func headersRawbodyTrailer(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/headersRawbodyTrailer")
            .header("trailer", "t1,t2,t3")
            .body(bodyStr)
            .trailer("t1", "v1")
            .trailer("t2", "v2")
            .build()
        let _ = client.send(request)
    }

    @TestCase
    func headersTrailers(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/headersTrailers")
            .header("trailer", "t1,t2,t3")
            .trailer("t1", "v1")
            .trailer("t2", "v2")
            .build()
        let _ = client.send(request)

        client.close()
        server.close()

        asanGC()
    }

    func startServer() {
        server.distributor.register("header", {ctx => checkHeader(ctx.request)})
        server
            .distributor
            .register(
                "/headersRawbodyTrailer",
                {
                    ctx =>
                    checkHeader(ctx.request)
                    checkBody(ctx.request)
                    checkTrailer(ctx.request)
                }
            )
        server.distributor.register(
            "/headersRawBody",
            {
                ctx =>
                checkHeader(ctx.request)
                checkBody(ctx.request)
            }
        )
        server
            .distributor
            .register(
                "/headersTrailers",
                {
                    ctx =>
                    checkHeader(ctx.request)
                    consumeBody(ctx.request)
                    checkTrailer(ctx.request)
                }
            )
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 100)
    }

    func checkHeader(request: HttpRequest) {
        let headersList = ArrayList<String>()
        for ((k, v) in request.headers) {
            headersList.add("${k}: ${collectionToArrayList(v)}")
        }
        @Assert(headersList.toString(), headerStr)
    }

    func checkBody(request: HttpRequest) {
        let buf = Array<UInt8>(50, repeat: 0)
        let bodyReceived = StringBuilder()
        var readLen = request.body.read(buf)
        while (readLen > 0) {
            bodyReceived.append(String.fromUtf8(buf[..readLen]))
            readLen = request.body.read(buf)
        }
        @Assert(bodyReceived.toString(), bodyStr)
    }

    func checkTrailer(request: HttpRequest) {
        let trailersList = ArrayList<String>()
        for ((k, v) in request.trailers) {
            trailersList.add("${k}: ${collectionToArrayList(v)}")
        }
        @Assert(trailersList.toString(), trailerStr)
    }

    func consumeBody(request: HttpRequest) {
        let buf = Array<UInt8>(10, repeat: 0)
        while (request.body.read(buf) > 0) {}
    }
}

func collectionToArrayList(collection: Collection<String>): ArrayList<String> {
    let arr = ArrayList<String>()
    for (str in collection) {
        arr.add(str)
    }
    return arr
}

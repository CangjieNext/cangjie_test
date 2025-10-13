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
 *      1. Server correctly send a response, which contains only header
 *      2. Server correctly send a response, which contains header and rawBody
 *      3. Server correctly send a response, which contains header, rawBody and trailer
 *      4. Server correctly send a response, which contains header, body and trailer, body is an implementation of InputStream in test case
 *      5. Server correctly send a response, which contains header and body, body is sent by calling write in HttpResponseWriter
 *      6. Server correctly send a response, which contains header, body and trailer, body is sent by calling write in HttpResponseWriter
 *      7. Server correctly send a response, which contains header and trailer
 *      8. Server correctly send a response, which contains a big header, which should be splited into HeadersFrame + ContinuationFrame
 *      9. Server correctly send a response, which should contain a date field in header automatically
 *      10. Server correctly send a response, when hasn't read request body to end
 *
 * Test API: public class Server {
 *      public func serve(): Unit
 * }
 */
package tests.server2_0

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.time.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import {asan.*, tlsconfig.*}

let headerStr = "[trailer: [t1, t2, t3]]"
let bodyStr = "first block, second block."
let bodyStr1 = "first block"
let bodyStr2 = ", second block."
let trailerStr = "[t1: [v1], t2: [v2]]"
let bigBody = Array<UInt8>(100 * 1024, repeat: 1)
let bigHeader = String(Array<Rune>(30000, repeat: r'a'))
let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).maxFrameSize(UInt32(2 ** 14)).build()
let client = ClientBuilder().tlsConfig(clientConfig()).maxHeaderListSize(UInt32.Max).build()

@Test
class TestWriteResponse {
    @TestCase
    func header(): Unit {
        startServer()
        let request = HttpRequestBuilder().version(HTTP2_0).url("https://127.0.0.1:${server.port}/header").build()
        let response = client.send(request)

        checkHeader(response)
    }

    @TestCase
    func headersRawBody(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/headersRawBody")
            .build()
        let response = client.send(request)

        checkHeader(response)
        checkBody(response)
    }

    @TestCase
    func headersRawbodyTrailer(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/headersRawbodyTrailer")
            .build()
        let response = client.send(request)

        checkHeader(response)
        checkBody(response)
        checkTrailer(response)
    }

    @TestCase
    func headersBodyTrailer(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/headersBodyTrailer")
            .build()
        let response = client.send(request)

        checkHeader(response)
        checkBody(response)
        checkTrailer(response)
    }

    @TestCase
    func headersBodyWriter(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/headersBodyWriter")
            .build()
        let response = client.send(request)

        checkHeader(response)
        checkBody(response)
    }

    @TestCase
    func headersBodyWriterTrailer(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/headersBodyWriterTrailer")
            .build()
        let response = client.send(request)

        checkHeader(response)
        checkBody(response)
        checkTrailer(response)
    }

    @TestCase
    func headersTrailers(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/headersTrailers")
            .build()
        let response = client.send(request)
        let buf = Array<UInt8>(1, repeat: 0)
        response.body.read(buf) // trailer is set only when body is read to end

        checkHeader(response)
        checkTrailer(response)
    }

    @TestCase
    func dateField(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/dateField")
            .header("date", "abc")
            .build()
        let response = client.send(request)

        checkDateField(response)
    }

    @TestCase
    func writeContinuationFrame(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/writeContinuationFrameHd")
            .build()
        let response = client.send(request)

        @Assert(response.headers.getFirst("bigHeader").getOrThrow(), bigHeader)
    }

    @TestCase
    func responseBeforeReadEnd(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${server.port}/header")
            .header("trailer", "t1,t2,t3")
            .body(bigBody)
            .trailer("t1", "v1")
            .trailer("t2", "v2")
            .build()

        let response = client.send(request)

        checkHeader(response)

        client.close()
        server.close()

        asanGC()
    }

    func startServer() {
        server.distributor.register("header", header)
        server.distributor.register("/headersRawbodyTrailer", headersRawbodyTrailer)
        server.distributor.register("/headersRawBody", headersRawBody)
        server.distributor.register("/headersBodyTrailer", headersBodyTrailer)
        server.distributor.register("/headersBodyWriter", headersBodyWriter)
        server.distributor.register("/headersBodyWriterTrailer", headersBodyWriterTrailer)
        server.distributor.register("/headersTrailers", headersTrailers)
        server.distributor.register("/dateField", {_ => ()})
        server.distributor.register("/writeContinuationFrameHd", writeContinuationFrameHd)
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 100)
    }

    func header(ctx: HttpContext): Unit {
        let _ = ctx.responseBuilder.header("trailer", "t1, t2, t3")
    }

    func headersRawBody(ctx: HttpContext): Unit {
        let _ = ctx.responseBuilder.header("trailer", "t1, t2, t3").body(bodyStr)
    }

    func headersRawbodyTrailer(ctx: HttpContext): Unit {
        let _ = ctx.responseBuilder.header("trailer", "t1, t2, t3").body(bodyStr).trailer("t1", "v1").trailer("t2", "v2")
    }

    func headersBodyTrailer(ctx: HttpContext): Unit {
        let _ = ctx.responseBuilder.header("trailer", "t1, t2, t3").body(Body()).trailer("t1", "v1").trailer("t2", "v2")
    }

    func headersBodyWriter(ctx: HttpContext): Unit {
        let _ = ctx.responseBuilder.header("trailer", "t1, t2, t3")
        let writer = HttpResponseWriter(ctx)
        writer.write(bodyStr1.toArray())
        writer.write(bodyStr2.toArray())
    }

    func headersBodyWriterTrailer(ctx: HttpContext): Unit {
        let responseBuilder = ctx.responseBuilder.header("trailer", "t1, t2, t3")
        let writer = HttpResponseWriter(ctx)
        writer.write(bodyStr1.toArray())
        writer.write(bodyStr2.toArray())
        let _ = responseBuilder.trailer("t1", "v1").trailer("t2", "v2")
    }

    func headersTrailers(ctx: HttpContext): Unit {
        let _ = ctx.responseBuilder.header("trailer", "t1, t2, t3").trailer("t1", "v1").trailer("t2", "v2")
    }

    func writeContinuationFrameHd(ctx: HttpContext): Unit {
        ctx.responseBuilder.header("bigHeader", bigHeader)
    }

    func checkHeader(response: HttpResponse) {
        let headersList = ArrayList<String>()
        for ((k, v) in response.headers) {
            if (k == "date") {
                continue
            }
            headersList.add("${k}: ${collectionToArrayList(v)}")
        }
        @Assert(headersList.toString(), headerStr)
    }

    func checkBody(response: HttpResponse) {
        let buf = Array<UInt8>(50, repeat: 0)
        let bodyReceived = StringBuilder()
        var readLen = response.body.read(buf)
        while (readLen > 0) {
            bodyReceived.append(String.fromUtf8(buf[..readLen]))
            readLen = response.body.read(buf)
        }
        @Assert(bodyReceived.toString(), bodyStr)
    }

    func checkTrailer(response: HttpResponse) {
        let trailersList = ArrayList<String>()
        for ((k, v) in response.trailers) {
            trailersList.add("${k}: ${collectionToArrayList(v)}")
        }
        @Assert(trailersList.toString(), trailerStr)
    }

    func checkDateField(response: HttpResponse) {
        let dateInHeader = response.headers.getFirst("date") ?? ""
        let dateStr = DateTime.nowUTC().format("www, dd MMM yyyy HH:mm:ss") + " GMT"
        @Assert(dateInHeader, dateStr)
    }
}

class Body <: InputStream {
    var cnt = 0

    public func read(arr: Array<UInt8>): Int64 {
        if (cnt == 0) {
            bodyStr1.toArray().copyTo(arr, 0, 0, bodyStr1.size)
            cnt++
            return bodyStr1.size
        }
        if (cnt == 1) {
            bodyStr2.toArray().copyTo(arr, 0, 0, bodyStr2.size)
            cnt++
            return bodyStr2.size
        }
        return 0
    }
}

func collectionToArrayList(collection: Collection<String>): ArrayList<String> {
    let arr = ArrayList<String>()
    for (str in collection) {
        arr.add(str)
    }
    return arr
}

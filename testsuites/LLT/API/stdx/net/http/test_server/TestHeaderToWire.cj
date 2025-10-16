/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description: test that different handlers return right responses
 *
 * Expect: expected responses
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

func handler1(ctx: HttpContext): Unit {
    println("write without Header")
    ctx.responseBuilder.body("hello world")
}

func expect1(resp: String): Int64 {
    if (!resp.contains("content-length:")) {
        return 1
    }
    if (resp.contains("content-type: text/plain")) { // can not identify content-type
        return 2
    }
    return 0
}

func handler2(ctx: HttpContext): Unit {
    println("Header mutation before write")
    ctx.responseBuilder.header("transfer-encoding", "chunked")
    ctx.responseBuilder.header("content-type", "some/type")
    let writer = HttpResponseWriter(ctx)
    writer.write("hello world".toArray())
    ctx.responseBuilder.trailer("too-late", "bogus")
}

func expect2(resp: String): Int64 {
    if (resp.contains("content-length:")) {
        return 1
    }
    if (!resp.contains("content-type: some/type")) {
        return 2
    }
    if (resp.contains("too-late")) {
        return 3
    }
    return 0
}

func handler3(ctx: HttpContext): Unit {
    println("write then useless Header mutation")
    ctx.responseBuilder.header("transfer-encoding", "chunked")
    let writer = HttpResponseWriter(ctx)
    writer.write("hello world".toArray())
    ctx.responseBuilder.trailer("too-late", "Write already wrote headers")
}

func expect3(resp: String): Int64 {
    if (resp.contains("too-late")) {
        return 1
    }
    return 0
}

func handler4(ctx: HttpContext): Unit {
    println("flush then write")
    ctx.responseBuilder.header("transfer-encoding", "chunked")
    let writer = HttpResponseWriter(ctx)
    writer.write("post-flush".toArray())
    ctx.responseBuilder.trailer("too-late", "Write already wrote headers")
}

func expect4(resp: String): Int64 {
    if (!resp.contains("transfer-encoding: chunked")) {
        return 1
    }
    if (resp.contains("too-late")) {
        return 2
    }
    return 0
}

func handler5(ctx: HttpContext): Unit {
    println("header then flush")
    ctx.responseBuilder.header("transfer-encoding", "chunked")
    ctx.responseBuilder.header("content-type", "some/type")
    let respWriter = HttpResponseWriter(ctx)
    respWriter.write("post-flush".toArray())
    ctx.responseBuilder.trailer("too-late", "Write already wrote headers")
}

func expect5(resp: String): Int64 {
    if (!resp.contains("transfer-encoding: chunked")) {
        return 1
    }
    if (resp.contains("too-late")) {
        return 2
    }
    if (!resp.contains("content-type: some/type")) {
        return 3
    }
    return 0
}

func handler6(ctx: HttpContext): Unit {
    println("sniff-on-first-write content-type")
    ctx.responseBuilder.header("transfer-encoding", "chunked")
    let respWriter = HttpResponseWriter(ctx)
    respWriter.write("<html><head></head><body>some html</body></html>".toArray())
    ctx.responseBuilder.trailer("content-type", "x/wrong")
}

func expect6(resp: String): Int64 {
    if (resp.contains("content-type: text/html")) {
        return 1
    }
    return 0
}

func handler7(ctx: HttpContext): Unit {
    println("explicit content-type wins")
    ctx.responseBuilder.header("transfer-encoding", "chunked")
    ctx.responseBuilder.header("content-type", "some/type")
    let respWriter = HttpResponseWriter(ctx)
    respWriter.write("<html><head></head><body>some html</body></html>".toArray())
}

func expect7(resp: String): Int64 {
    if (!resp.contains("content-type: some/type")) {
        return 1
    }
    return 0
}

// func handler8(ctx: HttpContext): Unit {
func handler8(_: HttpContext): Unit {
    println("empty handler")
}

func expect8(resp: String): Int64 {
    if (!resp.contains("content-length: 0")) {
        return 1
    }
    return 0
}

func handler9(ctx: HttpContext): Unit {
    println("only Header, no write")
    ctx.responseBuilder.header("Some-Header", "some-value")
}

func expect9(resp: String): Int64 {
    if (!resp.contains("some-header")) {
        return 1
    }
    return 0
}

func handler10(ctx: HttpContext): Unit {
    println("WriteHeader call")
    ctx.responseBuilder.status(404).header("too-late", "some-value")
}

func expect10(resp: String): Int64 {
    if (!resp.contains("404")) {
        return 1
    }
    if (!resp.contains("too-late")) {
        return 2
    }
    return 0
}

@Test
class TestHeaderToWire {
    var port: UInt16 = 0
    var server = ServerBuilder().addr("127.0.0.1").port(port).build()
    let arrayHandler = [handler1, handler2, handler3, handler4, handler5, handler6, handler7, handler8, handler9,
        handler10]
    let expectFunc = [expect1, expect2, expect3, expect4, expect5, expect6, expect7, expect8, expect9, expect10]

    func serve() {
        for (i in 0..10) {
            server.distributor.register("/${i + 1}", arrayHandler[i])
        }
        spawn {
            server.serve()
        }
    }

    @TestCase
    func test(): Unit {
        serve()
        sleep(Duration.second)
        port = server.port
        var respArray = Array<UInt8>(10000, repeat: 0)
        var client = TcpSocket("127.0.0.1", port)
        client.connect()
        for (i in 0..10) {
            var req = "GET /${i + 1} HTTP/1.1\r\nHost: foo\r\n\r\n"
            client.write(req.toArray())
            sleep(Duration.second)
            let len = client.read(respArray)
            var resp = String.fromUtf8(respArray.slice(0, len))
            let f = expectFunc[i]
            let res = f(resp)
            @Expect(res, 0)
        }
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}

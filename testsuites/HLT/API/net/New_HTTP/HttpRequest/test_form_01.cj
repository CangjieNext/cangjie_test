/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test form function
 * Test API: public prop form: Form
 */

import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.time.*
import std.sync.*
import stdx.encoding.url.*

var port = UInt16(0)
var server = ServerBuilder().addr("127.0.0.1").port(0).build()

@Test
class Test_HttpRequestBuilder_Form {
    func startserve(): Unit {
        var a: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                @Expect(httpContext.request.form.isEmpty(), false)
                @Expect(httpContext.request.form.get("2"), "3")
                @Expect(httpContext.request.form.get("1"), "2")
            }
        )
        var b: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                @Expect(httpContext.request.form.isEmpty(), false)
                @Expect(httpContext.request.form.get("1"), "3")
            }
        )
        var c: HttpRequestHandler = FuncHandler(
            {
                httpContext => try {
                    httpContext.request.form
                    @Expect(1, 2)
                } catch (e: UrlSyntaxException) {
                    println("check succes")
                }
            })
        var d: HttpRequestHandler = FuncHandler(
            {
                httpContext => @Expect(httpContext.request.form.get("filePath"), "doc/lib")
            })
        var e: HttpRequestHandler = FuncHandler({
            httpContext => @Expect(httpContext.request.form.isEmpty(), false)
        })
        server.distributor.register("/test/a", a)
        server.distributor.register("/test/b", b)
        server.distributor.register("/test/c", c)
        server.distributor.register("/test/d", d)
        server.distributor.register("/test/e", e)
        server.serve()
    }

    //form 格式非法
    @TestCase
    func test_form_01(): Unit {
        spawn {
            startserve()
        }

        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port
        var req1 = HttpRequestBuilder()
            .method("POST")
            .header("content-type", "application/x-www-form-urlencoded")
            .body("?abc%hhh")
            .url("http://127.0.0.1:${port}/test/c")
            .build()
        var client = ClientBuilder().build()
        var response1 = client.send(req1)
        @Expect(response1.status, UInt16(200))
        client.close()
    }

    // 请求方法为 POST，PUT，PATCH，且 content-type 包含 application/x-www-form-urlencoded，
    // 获取请求 body 部分，用 form 格式解析成功
    @TestCase
    func test_form_02(): Unit {
        var req1 = HttpRequestBuilder()
            .method("POST")
            .header("content-type", "application/x-www-form-urlencoded")
            .body("2=3&1=2")
            .url("http://127.0.0.1:${port}/test/a")
            .build()
        var req2 = HttpRequestBuilder()
            .method("PUT")
            .header("content-type", "application/x-www-form-urlencoded")
            .body("1=3&1=2")
            .url("http://127.0.0.1:${port}/test/b")
            .build()
        var req3 = HttpRequestBuilder()
            .method("PATCH")
            .header("content-type", "application/x-www-form-urlencoded")
            .body("1=3&1=2")
            .url("http://127.0.0.1:${port}/test/b")
            .build()
        var client = ClientBuilder().build()
        var response1 = client.send(req1)
        @Expect(response1.status, UInt16(200))
        var response2 = client.send(req2)
        @Expect(response2.status, UInt16(200))
        var response3 = client.send(req3)
        @Expect(response3.status, UInt16(200))
        client.close()
    }

    // 如果请求方法不为 POST，PUT，PATCH, 获取请求 url 中 query 部分
    @TestCase
    func test_form_03(): Unit {
        var req1 = HttpRequestBuilder()
            .method("HEAD")
            .header("content-type", "application/x-www-form-urlencoded")
            .body("2=3&1=2&filePath=123")
            .url("http://127.0.0.1:${port}/test/d?ref=master&filePath=doc%2Flib")
            .build()
        var client = ClientBuilder().build()
        var response1 = client.send(req1)
        @Expect(response1.status, UInt16(200))
        client.close()
    }

    // 请求 url 中 query 部分非法
    @TestCase
    func test_form_04(): Unit {
        try {
            var req1 = HttpRequestBuilder()
                .method("HEAD")
                .header("content-type", "application/x-www-form-urlencoded")
                .body("2=3&1=2&filePath=123")
                .url("http://127.0.0.1:${port}/test/d?a=3%h")
                .build()
            var client = ClientBuilder().build()
            var response1 = client.send(req1)
            @Expect(1, 2)
        } catch (e: UrlSyntaxException) {
            println(e.message)
        }
    }

    // 在构建后立刻获取form
    @TestCase
    func test_form_05(): Unit {
        var req1 = HttpRequestBuilder()
            .method("POST")
            .header("content-type", "application/x-www-form-urlencoded")
            .body("2=3c&1=2b")
            .url("http://127.0.0.1:${port}/test/e")
            .build()
        @Expect(req1.form.get("2"), "3c")
        @Expect(req1.form.get("1"), "2b")
        var client = ClientBuilder().build()
        var response1 = client.send(req1)
        @Expect(response1.status, UInt16(200))
        client.close()
        server.close()
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test body function
 * Test API: public func body(body: Array<UInt8>): HttpResponseBuilder
 *           public func body(body: String): HttpResponseBuilder
 *           public func body(body: InputStream): HttpResponseBuilder
 */

import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.time.*
import std.sync.*
import std.collection.*
import std.io.*
import stdx.log.*
import stdx.logger.*
import std.console.Console

var port = UInt16(0)
var server = ServerBuilder().addr("127.0.0.1").port(0).build()

public class test_inputStream <: InputStream {
    public func read(buffer: Array<Byte>): Int64 {
        return -1
    }
}

@Test
class Test_HttpResponseBuilder_Body_06 {
    func startserve(): Unit {
        // 不设置content-length
        var c: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                var ins = test_inputStream()
                // ins.write(Array<Byte>(2000, repeat: UInt8(2)))
                httpContext.responseBuilder.body(ins)
            }
        )
        server.distributor.register("/test/c", c)
        server.logger.level = LogLevel.TRACE
        server.serve()
    }

    // 长度关系：content-length = body长度
    @TestCase
    func test_body_01(): Unit {
        //此协程一直开启,需作为第一个case
        spawn {
            startserve()
        }

        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port
        var req3 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/c").build()

        var client = ClientBuilder().build()
        var response3 = client.send(req3)
        @Expect(response3.status, UInt16(500))

        var buf3 = Array<UInt8>(10000, repeat: 0)
        var readlen3 = response3.body.read(buf3)
        @Expect(String.fromUtf8(buf3[0..readlen3]), "Internal Server Error")
        client.close()
        server.close()
    }
}

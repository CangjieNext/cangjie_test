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
 * Test description: Test remoteAddr function
 * Test API: public prop remoteAddr: String
 */

import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.time.*
import std.sync.*
import stdx.encoding.url.*

var port = UInt16(0)
var server = ServerBuilder().addr("127.0.0.1").port(0).build()

@Test
class Test_HttpRequestBuilder_RemoteAddr {
    func startserve(): Unit {
        var a: HttpRequestHandler = FuncHandler(
            {
                httpContext =>
                var bodyBuf = Array<UInt8>(3000, repeat: 0)
                httpContext.request.body.read(bodyBuf)
                @Expect(httpContext.request.remoteAddr.contains("127.0.0.1:"), true)
            }
        )
        server.distributor.register("/test/a", a)
        server.serve()
    }

    @TestCase
    func test_form_01(): Unit {
        spawn {
            startserve()
        }

        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        port = server.port
        var req1 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/a").build()
        @Expect(req1.remoteAddr, "")
        var client = ClientBuilder().build()
        var response1 = client.send(req1)
        @Expect(response1.status, UInt16(200))
        client.close()
        server.close()
    }
}

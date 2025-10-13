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
 * Check whether the correct handle can be found based on the request.
 */

package tests.go_serve

import stdx.net.http.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*

var requestAndExpected: Array<(String, UInt16)> = [
    ("/", 404),
    ("/dir", 404),
    ("/dir./", 404),
    ("/dir/", 200),
    ("/search", 201),
    ("/search/", 404),
    ("../search", 201),
    ("./search", 201),
    ("codesearch.google.com/search", 202),
    ("/codesearch.google.com/search", 202),
    ("codesearch.google.com/", 203),
    ("codesearch.google.com/", 203)
]

func serve(code: Int64): FuncHandler {
    FuncHandler {
        httpContext => httpContext.responseBuilder.status(UInt16(code))
    }
}

var handlerRegister: Array<(String, HttpRequestHandler)> = [
    ("/dir/", serve(200)),
    ("/search", serve(201)),
    ("codesearch.google.com/search", serve(202)),
    ("codesearch.google.com/", serve(203))
]

@Test
class TestServeMuxHandler {
    var count = 0

    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func doTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendContentRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        for (v in handlerRegister) {
            server.distributor.register(v[0], v[1])
        }
        spawn {
            server.serve()
        }
    }

    func sendContentRequest() {
        var count = 0
        let client = ClientBuilder().build()
        for (turple in requestAndExpected) {
            let resp = client.get("http://127.0.0.1:${port}${addSlash(turple[0])}")
            if (resp.status == turple[1]) {
                count++
            } else {
                println(turple[0])
            }
        }
        @Expect(count, requestAndExpected.size)
        client.close()
    }
}

func addSlash(str: String): String {
    if (!str.isEmpty() && str[0] != b'/') {
        return "/${str}"
    } else {
        return str
    }
}

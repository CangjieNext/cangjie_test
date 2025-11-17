/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 * Test API:
 */
package tests.handler

import stdx.net.http.*
import std.fs.*
import std.collection.*
import stdx.log.*
import std.sync.*
import std.time.*
import asan.*

let boundary = "----WebKitFormBoundary7B8HS8VxGf4OHfS7"
let boundaryArr1 = "------WebKitFormBoundary7B8HS8VxGf4OHfS7".toArray()
let boundaryArr2 = "------WebKitFormBoundary7B8HS8VxGf4OHfS7--".toArray()
let CRLF = "\r\n".toArray()
let CRLF_CRLF = "\r\n\r\n".toArray()

@Test
class TestSlash {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    @TestCase
    func slash(): Unit {
        startServer()
        let client = ClientBuilder().build()
        let req = HttpRequestBuilder()
            .post()
            .url("http://127.0.0.1:${server.port}/upload")
            .header("content-type", "multipart/form-data; boundary=${boundary}")
            .body(buildBodyData())
            .build()
        try {
            client.send(req)
        } finally {
            //linux
            if (exists("./\\..\\test.txt")) {
                remove("./\\..\\test.txt")
            }
            //windows
            if (exists("..\\test.txt")) {
                remove("..\\test.txt")
                @Expect(false)
            }
        }

        client.close()
        server.close()

        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/upload", FileHandler("./", handlerType: UpLoad))
        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }

    func buildBodyData(): String {
        let body = StringBuilder()
        body.appendFromUtf8(boundaryArr1)
        body.appendFromUtf8(CRLF)
        body.appendFromUtf8("Content-Disposition: filename=\"\\..\\test.txt\"".toArray())
        body.appendFromUtf8(CRLF_CRLF)
        body.appendFromUtf8("sss\r\n".toArray())
        body.appendFromUtf8(CRLF)
        body.appendFromUtf8(boundaryArr2)
        body.appendFromUtf8(CRLF)
        return body.toString()
    }
}

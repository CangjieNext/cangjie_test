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
import stdx.net.tls
import stdx.crypto.kit
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
class TestUpload {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    let client = ClientBuilder().build()

    @BeforeAll
    func setup() {
        startServer()
    }

    @AfterAll
    func cleanup() {
        client.close()
        server.close()
        asanGC()
    }

    func testUpload(uploadFilename: String, validateFilename: String) {
        let req = HttpRequestBuilder()
            .post()
            .url("http://127.0.0.1:${server.port}/upload")
            .header("content-type", "multipart/form-data; boundary=${boundary}")
            .body(buildBodyData(uploadFilename))
            .build()
        try {
            let resp = client.send(req)
            @Assert(resp.status, 200)
            @Expect(exists(validateFilename))
        } finally {
            remove(validateFilename)
        }
    }

    @TestCase
    func uploadSuccess(): Unit {
        testUpload("upload.test", "upload.test")
    }

    @TestCase
    func uploadWithDir1(): Unit {
        testUpload("../upload.test", "upload.test")
    }

    @TestCase
    func uploadWithDir2(): Unit {
        testUpload("abc/upload.test", "upload.test")
    }

    @TestCase
    func uploadWithDir3(): Unit {
        testUpload("/tmp/upload.test", "upload.test")
    }

    func startServer(): Unit {
        server.distributor.register("/upload", FileHandler("./", handlerType: UpLoad))

        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }

    func buildBodyData(fileName: String): String {
        let body = StringBuilder()
        body.appendFromUtf8(boundaryArr1)
        body.appendFromUtf8(CRLF)
        body.appendFromUtf8("Content-Disposition: form-data; name=\"myFile\"; filename=\"${fileName}\"".toArray())
        body.appendFromUtf8(CRLF_CRLF)
        body.appendFromUtf8(
            "[{\r\n\"test\": \"this is a json file\"\r\n}, {\r\n\"test\": \"this is a json file\"\r\n}]\r\n".toArray())
        body.appendFromUtf8(CRLF)
        body.appendFromUtf8(boundaryArr2)
        body.appendFromUtf8(CRLF)
        return body.toString()
    }
}

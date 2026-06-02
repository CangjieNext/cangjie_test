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

package tests.handler

import stdx.net.http.*
import std.fs.*
import std.sync.*
import std.time.*
import asan.*

let boundary = "boundary"
let boundaryArr1 = "--boundary".toArray()
let boundaryArr2 = "--boundary--".toArray()
let CRLF = "\r\n".toArray()
let CRLF_CRLF = "\r\n\r\n".toArray()

@Test
class TestFileUploadSecurity {
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

    func testUploadRejected(fileName: String): Unit {
        let req = HttpRequestBuilder()
            .post()
            .url("http://127.0.0.1:${server.port}/upload")
            .header("content-type", "multipart/form-data; boundary=${boundary}")
            .body(buildBodyData(fileName))
            .build()
        let resp = client.send(req)
        @Assert(resp.status, 400)
    }

    @TestCase
    func windowsReservedCON(): Unit {
        testUploadRejected("CON")
    }

    @TestCase
    func windowsReservedPRN(): Unit {
        testUploadRejected("PRN")
    }

    @TestCase
    func windowsReservedAUX(): Unit {
        testUploadRejected("AUX")
    }

    @TestCase
    func windowsReservedNUL(): Unit {
        testUploadRejected("NUL")
    }

    @TestCase
    func windowsReservedCOM1(): Unit {
        testUploadRejected("COM1")
    }

    @TestCase
    func windowsReservedCOM5(): Unit {
        testUploadRejected("COM5")
    }

    @TestCase
    func windowsReservedCOM9(): Unit {
        testUploadRejected("COM9")
    }

    @TestCase
    func windowsReservedLPT1(): Unit {
        testUploadRejected("LPT1")
    }

    @TestCase
    func windowsReservedLPT5(): Unit {
        testUploadRejected("LPT5")
    }

    @TestCase
    func windowsReservedLPT9(): Unit {
        testUploadRejected("LPT9")
    }

    @TestCase
    func windowsReservedCONWithExtension(): Unit {
        testUploadRejected("CON.txt")
    }

    @TestCase
    func windowsReservedAUXWithExtension(): Unit {
        testUploadRejected("AUX.log")
    }

    @TestCase
    func windowsReservedNULWithExtension(): Unit {
        testUploadRejected("NUL.dat")
    }

    @TestCase
    func windowsReservedCOM1WithExtension(): Unit {
        testUploadRejected("COM1.txt")
    }

    @TestCase
    func windowsReservedLPT1WithExtension(): Unit {
        testUploadRejected("LPT1.txt")
    }

    @TestCase
    func windowsReservedLowercase(): Unit {
        testUploadRejected("con")
    }

    @TestCase
    func windowsReservedMixedCase(): Unit {
        testUploadRejected("CoN")
    }

    @TestCase
    func windowsReservedLowercaseWithExtension(): Unit {
        testUploadRejected("aux.txt")
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
        body.appendFromUtf8("test content".toArray())
        body.appendFromUtf8(CRLF)
        body.appendFromUtf8(boundaryArr2)
        body.appendFromUtf8(CRLF)
        return body.toString()
    }
}

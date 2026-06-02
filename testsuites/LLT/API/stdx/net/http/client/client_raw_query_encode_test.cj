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
 *   Verify that HTTP/1.1 client preserves percent-encoded special characters
 *   in query string and fragment when constructing the request-target line.
 *   Before the fix, the client used decoded query/fragment attributes,
 *   causing %26→&, %3D→=, %23→# etc. to be decoded prematurely.
 *
 *   This test uses raw TCP socket capture to verify the actual bytes sent
 *   on the wire, ensuring RFC 3986/9110 compliance for origin-form.
 *
 * Test API:
 *   HttpRequestBuilder, Client, TcpServerSocket
 */

package tests.client

import stdx.net.http.*
import std.net.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
class TestRawQueryEncode {

    @TestCase
    /* Verify that %26 (encoded ampersand) in query is preserved in request-target */
    func testPercent26Preserved(): Unit {
        let (requestLine, _) = captureOneRequest("/search?q=a%26b")
        @Expect(requestLine.contains("%26"))
        @Expect(!requestLine.contains("q=a&b"))
    }

    @TestCase
    /* Verify that %3D (encoded equals sign) in query is preserved in request-target */
    func testPercent3DPreserved(): Unit {
        let (requestLine, _) = captureOneRequest("/search?q=a%3Db")
        @Expect(requestLine.contains("%3D"))
        @Expect(!requestLine.contains("q=a=b"))
    }

    @TestCase
    /* Verify that %23 (encoded hash) in fragment is preserved in request-target */
    func testPercent23InFragment(): Unit {
        let (requestLine, _) = captureOneRequest("/page#section%231")
        @Expect(requestLine.contains("%23"))
        @Expect(!requestLine.contains("#section#1"))
    }

    @TestCase
    /* Verify that %3F (encoded question mark) in query is preserved in request-target */
    func testPercent3FPreserved(): Unit {
        let (requestLine, _) = captureOneRequest("/search?q=a%3Fb")
        @Expect(requestLine.contains("%3F"))
    }

    @TestCase
    /* Verify that %2F (encoded forward slash) in query is preserved in request-target */
    func testPercent2FPreserved(): Unit {
        let (requestLine, _) = captureOneRequest("/search?q=a%2Fb")
        @Expect(requestLine.contains("%2F"))
        @Expect(!requestLine.contains("q=a/b"))
    }

    @TestCase
    /* Verify that %25 (encoded percent sign) in query is preserved in request-target */
    func testPercent25Preserved(): Unit {
        let (requestLine, _) = captureOneRequest("/search?q=100%25done")
        @Expect(requestLine.contains("%25"))
        @Expect(!requestLine.contains("q=100%done"))
    }

    @TestCase
    /* Verify that UTF-8 encoded Chinese characters in query are preserved */
    func testUtf8EncodedQuery(): Unit {
        let (requestLine, _) = captureOneRequest("/search?q=%E4%BB%93%E9%A2%89")
        @Expect(requestLine.contains("%E4%BB%93%E9%A2%89"))
    }

    @TestCase
    /* Verify that multiple encoded parameters with %26 separator are preserved */
    func testMultipleEncodedParams(): Unit {
        let (requestLine, _) = captureOneRequest("/search?q=hello%26world%3Dtest%23end")
        @Expect(requestLine.contains("%26"))
        @Expect(requestLine.contains("%3D"))
        @Expect(requestLine.contains("%23"))
    }

    @TestCase
    /* Verify that combined query and fragment encoding are both preserved */
    func testCombinedQueryAndFragmentEncoding(): Unit {
        let (requestLine, _) = captureOneRequest("/search?q=a%26b#frag%23ment")
        @Expect(requestLine.contains("?q=a%26b"))
        @Expect(requestLine.contains("#frag%23ment"))
    }

    @TestCase
    /* Verify that fragment-only URL with encoding is preserved */
    func testFragmentOnlyEncoding(): Unit {
        let (requestLine, _) = captureOneRequest("/page#sec%23tion%26end")
        @Expect(!requestLine.contains("?"))
        @Expect(requestLine.contains("#sec%23tion%26end"))
    }

    @TestCase
    /* Verify that normal query without special encoding still works correctly */
    func testNormalQueryUnchanged(): Unit {
        let (requestLine, _) = captureOneRequest("/search?key=value&foo=bar")
        @Expect(requestLine.contains("?key=value&foo=bar"))
    }

    @TestCase
    /* Verify that request without query string still works correctly */
    func testNoQueryString(): Unit {
        let (requestLine, _) = captureOneRequest("/path")
        @Expect(requestLine.contains("/path"))
        @Expect(!requestLine.contains("?"))
    }

    @TestCase
    /* Verify that empty query value with encoding is handled correctly */
    func testEmptyQueryValue(): Unit {
        let (requestLine, _) = captureOneRequest("/search?q=")
        @Expect(requestLine.contains("?q="))
        asanGC()
    }

    /**
     * Helper: create a fresh TCP server, send one HTTP request via the real client,
     * and capture the raw request line. Uses a fixed-size buffer written by the
     * spawned server thread (reference semantics, no mutable variable capture).
     */
    func captureOneRequest(path: String): (String, String) {
        let serverSocket = TcpServerSocket(bindAt: 0)
        serverSocket.bind()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        /* Fixed-size buffer: array has reference semantics, so spawned thread
         * can write into the same array without capturing a mutable variable. */
        let buf = Array<UInt8>(4096, repeat: 0)

        spawn {
            try {
                let conn = serverSocket.accept()
                let len = conn.read(buf)
                conn.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK".toArray())
                conn.close()
            } catch (_: Exception) {}
            serverSocket.close()
        }

        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${port}${path}").build()
        try {
            client.send(req)
        } catch (_: Exception) {}
        client.close()

        /* Give server time to finish reading */
        sleep(Duration.millisecond * 500)
        let raw = String.fromUtf8(buf)
        let lines = raw.split("\r\n")
        let requestLine = if (!lines.isEmpty()) { lines[0] } else { "" }
        return (requestLine, raw)
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
import std.env.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import std.net.*
import stdx.log.*
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package -Woff all  %f -o %output %cmp_utest_opt 
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1
// ASSERT: scan request target host:www.baidu.com port:80

// SCAN DEBUG [thread#1] [Client#doRequest] start send request
// SCAN DEBUG [thread#1] [Client#getClient] Using HTTP/1.1 client
// SCAN DEBUG [thread#1] [Client#doRequest] send request:
// SCAN GET / HTTP/1.1

// SCAN DEBUG [thread#1] [HttpClient1#request] request target host:baidu.com port:80
// SCAN DEBUG [thread#1] [HttpClient1#request] request proxy host:127.0.0.1 port:65535
// SCAN DEBUG [thread#1] [HttpEngine1#getConn] Client1_1 get conn new
// SCAN url: http://baidu.com:80 msg: Failed to connect 111: Connection refused.
// SCAN DEBUG [thread#1] [Client#doRequest] start send request
// SCAN DEBUG [thread#1] [Client#getClient] Using HTTP/1.1 client
// SCAN DEBUG [thread#1] [Client#doRequest] send request:
// SCAN GET / HTTP/1.1

// SCAN DEBUG [thread#1] [HttpClient1#request] request target host:xiaomi.com port:80
// SCAN DEBUG [thread#1] [HttpClient1#request] request proxy host:127.0.0.1 port:65535
// SCAN DEBUG [thread#1] [HttpEngine1#getConn] Client1_1 get conn new
// SCAN url: http://xiaomi.com:80 msg: Failed to connect 111: Connection refused.
// SCAN DEBUG [thread#1] [Client#doRequest] start send request
// SCAN DEBUG [thread#1] [Client#getClient] Using HTTP/1.1 client
// SCAN DEBUG [thread#1] [Client#doRequest] send request:
// SCAN GET / HTTP/1.1

// SCAN DEBUG [thread#1] [HttpClient1#request] request target host:www.baidu.com port:80
// SCAN DEBUG [thread#1] [HttpClient1#request] request proxy host:127.0.0.1 port:65535
// SCAN DEBUG [thread#1] [HttpEngine1#getConn] Client1_1 get conn new
// SCAN url: http://www.baidu.com:80 msg: Failed to connect 111: Connection refused.
// SCAN DEBUG [thread#1] [Client#doRequest] start send request
// SCAN DEBUG [thread#1] [Client#getClient] Using HTTP/1.1 client
// SCAN DEBUG [thread#1] [Client#doRequest] send request:
// SCAN GET / HTTP/1.1

// SCAN DEBUG [thread#1] [HttpClient1#request] request target host:www.baidu.com port:80
// SCAN DEBUG [thread#1] [HttpClient1#request] request proxy host:127.0.0.1 port:65535
// SCAN DEBUG [thread#1] [HttpEngine1#getConn] Client1_1 get conn new
// SCAN url: http://www.baidu.com:80 msg: Failed to connect 111: Connection refused.

func withEnv(key: String, value: String, f: () -> Unit): Unit {
    let old = getVariable(key)
    setVariable(key, value)
    try {
        f()
    } finally {
        match (old) {
            case Some(v) => setVariable(key, v)
            case None => removeVariable(key)
        }
    }
}

func withProxyEnv(httpProxy: String, noProxy: String, f: () -> Unit): Unit {
    withEnv("http_proxy", httpProxy) {
        withEnv("https_proxy", "") {
            withEnv("no_proxy", noProxy) {
                f()
            }
        }
    }
}

func AssertGetThrowMessage<E>(url: String, msg: String) where E <: Exception {
    let client = ClientBuilder().build()
    client.logger.level = LogLevel.DEBUG
    let e: E = @AssertThrows[E](client.get(url))
    println("url: ${url} msg: ${e.message}")
    @Expect(e.message.contains(msg))
}

func assertByPass(url: String) {
    let client = ClientBuilder().build()
    client.logger.level = LogLevel.DEBUG
    try {
        ClientBuilder().build().get(url)
    } catch (e: SocketException) {
        @Fail("expected bypass for ${url}, but request still used proxy")
    }
}

@Test
class ProxyTest {
    @BeforeEach
    func before() {
        removeVariable("http_proxy")
        removeVariable("https_proxy")
        removeVariable("no_proxy")
    }

    @TestCase
    func testNoProxyNotMatch_shouldUseProxy_andThrow() {
        withProxyEnv("http://127.0.0.1:65535", "aidu.com:80") {
            AssertGetThrowMessage<SocketException>("http://baidu.com:80", "Failed to connect 111")
        }
    }

    @TestCase
    func testNoProxySuffixMatch_shouldBypassProxy_andSucceed() {
        withProxyEnv("http://127.0.0.1:65535", "baidu.com:80") {
            assertByPass("http://www.baidu.com:80")
        }
    }

    @TestCase
    func testNoProxyLeadingDot_shouldBypassProxy_andSucceed() {
        withProxyEnv("http://127.0.0.1:65535", ".baidu.com:80") {
            assertByPass("http://www.baidu.com:80")
        }
    }

    @TestCase
    func testNoProxyBoundary_shouldNotMatch_notbaidu_andThrow() {
        withProxyEnv("http://127.0.0.1:65535", "mi.com:80") {
            AssertGetThrowMessage<SocketException>("http://xiaomi.com:80", "")
        }
    }

    @TestCase
    func testNoProxyPortMismatch_shouldUseProxy_andThrow2() {
        withProxyEnv("http://127.0.0.1:65535", "aidu.com:80") {
            AssertGetThrowMessage<SocketException>("http://www.baidu.com:80", "")
        }
    }

    @TestCase
    func testNoProxyPortMismatch_shouldUseProxy_andThrow() {
        withProxyEnv("http://127.0.0.1:65535", "baidu.com:81") {
            AssertGetThrowMessage<SocketException>("http://www.baidu.com:80", "")
        }
    }

    @TestCase
    func testNoProxyAsterisk_shouldBypassProxy_andSucceed() {
        withProxyEnv("http://127.0.0.1:65535", "*") {
            assertByPass("http://www.baidu.com:80")
        }
    }
}
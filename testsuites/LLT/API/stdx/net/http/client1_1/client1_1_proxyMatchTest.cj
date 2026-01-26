import std.env.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import std.net.*
import stdx.log.*

// ASSERT: scan request target host:www.baidu.com port:808

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

func newDebugClient(): Client {
    let client = ClientBuilder().build()
    return client
}

func AssertGetThrowMessage<E>(url: String, msg: String) where E <: Exception {
    let client = newDebugClient()
    client.logger.level = LogLevel.DEBUG
    let e: E = @AssertThrows[E](client.get(url))
    println("url: ${url} msg: ${e.message}")
    @Expect(e.message.contains(msg))
}

@Test
class ProxyTest {
    @BeforeEach
    func before() {
        removeVariable("http_proxy")
        removeVariable("https_proxy")
        removeVariable("no_proxy")
    }

    @Skip
    @TestCase
    func testNoProxyNotMatch_shouldUseProxy_andThrow() {
        withProxyEnv("http://127.0.0.1:65535", "aidu.com:80") {
            AssertGetThrowMessage<SocketException>("http://baidu.com:80", "Failed to connect 111")
        }
    }

    @Skip
    @TestCase
    func testNoProxySuffixMatch_shouldBypassProxy_andSucceed() {
        withProxyEnv("http://127.0.0.1:65535", "baidu.com:80") {
            try {
                ClientBuilder().build().get("http://www.baidu.com:80")
            } catch (e: SocketException) {
                @Fail("expected bypass (no_proxy matched), but request still used proxy: ${e}")
            }
        }
    }

    @Skip
    @TestCase
    func testNoProxyLeadingDot_shouldBypassProxy_andSucceed() {
        withProxyEnv("http://127.0.0.1:65535", ".baidu.com:80") {
            try {
                ClientBuilder().build().get("http://www.baidu.com:80")
            } catch (e: SocketException) {
                @Fail("expected bypass for .mi.com:80, but request still used proxy: ${e}")
            }
        }
    }

    @Skip
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

    @Skip
    @TestCase
    func testNoProxyPortMismatch_shouldUseProxy_andThrow() {
        withProxyEnv("http://127.0.0.1:65535", "baidu.com:81") {
            AssertGetThrowMessage<SocketException>("http://www.baidu.com:80", "")
        }
    }

    @Skip
    @TestCase
    func testNoProxyAsterisk_shouldBypassProxy_andSucceed() {
        withProxyEnv("http://127.0.0.1:65535", "*") {
            try {
                _ = ClientBuilder().build().get("http://www.baidu.com:80")
            } catch (e: SocketException) {
                @Fail("expected bypass for no_proxy=*, but request still used proxy: ${e}")
            }
        }
    }
}

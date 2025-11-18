/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.collection.*
import stdx.encoding.url.*
import stdx.net.http.*
import stdx.crypto.keys.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate, PrivateKey}
import std.fs.*
import std.io.*

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.alpnProtocolsList = ["h2"]
    tlsConfig
}

@Test
public class Test_CookieJar {
    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.header("a", "a")})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let request = HttpRequestBuilder()
            .method("GET")
            .url("https://127.0.0.1:${server.port}/dd")
            .version(HTTP2_0)
            .build()

        let client = ClientBuilder().cookieJar(cookiejar).tlsConfig(clientConfig()).build()
        var a = client.send(request)
        @Expect(a.status,200)
        var cookiesFromJar = cookiejar.getCookies(URL.parse("https://127.0.0.1:${server.port}/dd"))
        @Expect(CookieJar.toCookieString(cookiesFromJar), "")
    }

    @TestCase
    func set_cookiejar(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.header("a", "a")})
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        var cookiejar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let ck: Cookie = Cookie("abc", "123456")
        var arr: ArrayList<Cookie> = ArrayList<Cookie>.of(ck)
        var str1 = "https://127.0.0.1:${server.port}/dd"
        let url = URL.parse(str1)
        cookiejar.storeCookies(url, arr)
        let request = HttpRequestBuilder()
            .method("GET")
            .url("https://127.0.0.1:${server.port}/dd")
            .version(HTTP2_0)
            .build()

        let client = ClientBuilder().cookieJar(cookiejar).tlsConfig(clientConfig()).build()
        var a = client.send(request)
        @Expect(a.status,200)
        var cookiesFromJar = cookiejar.getCookies(URL.parse("https://127.0.0.1:${server.port}/dd"))
        @Expect(CookieJar.toCookieString(cookiesFromJar), "abc=123456")
    }
}

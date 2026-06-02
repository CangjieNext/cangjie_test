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
 * Test description:
 *
 * Test API:
 *
 */

package tests.client

import stdx.net.http.*
import std.net.*
import std.time.*
import stdx.log.*
import stdx.logger.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.convert.Parsable
import std.console.Console

@Test
class TestClient {
    @TestCase
    func testBuildClientNoArgs(): Unit {
        let client = ClientBuilder().build()
        client.close()
    }

    @TestCase
    func testBuildClientPartArgs(): Unit {
        let client = ClientBuilder()
            .httpProxy("192.168.0.1:80")
            .httpsProxy("192.168.0.1:443")
            .noProxy()
            .connector(
                {
                    sa: SocketAddress =>
                    let socket = TcpSocket(sa)
                    socket.readTimeout = Duration.second * 100
                    socket.writeTimeout = Duration.second * 100
                    socket.connect()
                    return socket
                }
            )
            .cookieJar(MyCookieJar())
            .readTimeout(Duration.Max)
            .writeTimeout(Duration.Max)
            .poolSize(100)
            .autoRedirect(false)
            .logger(SimpleLogger(Console.stdOut))
            .build()
        client.close()
    }
}

class MyCookieJar <: CookieJar {
    public prop rejectPublicSuffixes: ArrayList<String> {
        get() {
            ArrayList<String>()
        }
    }
    public prop isHttp: Bool {
        get() {
            false
        }
    }

    public func clear(): Unit {
        ()
    }

    public func storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit {
        ()
    }

    public func getCookies(url: URL): ArrayList<Cookie> {
        ArrayList<Cookie>()
    }

    public func removeCookies(domain: String): Unit {
        ()
    }
}

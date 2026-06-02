/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle -o %output --test
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args 2>&1

/*
 * Test description:
 *     Test http2 server, while response body is huge.
 * Test API:
 */

package tests.server

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import std.fs.*
import std.io.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestHttp2WaitWindow {
    func startServer(): Server {
        let server = ServerBuilder().addr("0.0.0.0").port(0).tlsConfig(serverConfig()).build()
        server.distributor.register("/hello") {
            ctx => ctx.responseBuilder.body(BigBody(2 ** 15)) // body size = 64K
        }
        spawn {server.serve()}
        while (server.port == 0) {
            sleep(Duration.millisecond * 10)
        }
        return server
    }

    @TestCase
    func bigBodyTest(): Unit {
        let server = startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        let cnt = AtomicInt64(0)
        let errCnt = AtomicInt64(0)
        let times = 10
        for (_ in 0..times) {
            spawn {
                let rsp = client.get("https://127.0.0.1:${server.port}/hello")
                let buffer = Array<Byte>(4 * 1024, repeat: 0)
                try {
                    while (rsp.body.read(buffer) != 0) {}
                } catch (e: Exception) {
                    errCnt.fetchAdd(1)
                }
                cnt.fetchAdd(1)
            }
        }
        while (cnt.load() < times) {
            sleep(Duration.millisecond * 10)
        }
        println("total: ${cnt.load()}, error: ${errCnt.load()}")
        @Expect(cnt.load(), times)
        @Expect(errCnt.load(), 0)
        client.close()
        server.close()
        asanGC()
    }
}

class BigBody <: InputStream {
    var totalSize: Int64
    static let data = Array<Byte>(4 * 1024, repeat: b'a')

    public init(size: Int64) {
        totalSize = size
    }

    public func read(buffer: Array<Byte>): Int64 {
        if (totalSize <= 0) {
            return -1
        }
        data.copyTo(buffer)
        totalSize -= data.size
        return data.size
    }
}

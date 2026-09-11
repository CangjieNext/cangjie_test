/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt %f asan.%middle tlsconfig.%middle -o %output --test
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test the HTTP/2 server enforces maxRequestBodySize on DATA frames.
 *      Related issue: https://gitcode.com/Cangjie/cangjie_stdx/issues/338
 *      A request body exceeding the configured limit must be rejected
 *      (stream reset with REFUSED_STREAM) instead of being fully delivered
 *      to the handler, while a body within the limit is accepted.
 * Test API:
 *      public func maxRequestBodySize(size: Int64): ServerBuilder
 */

package tests.http2_body_size_limit

import stdx.net.http.*
import stdx.net.tls.*
import std.io.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

class StreamingBody <: InputStream {
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

@Test
class TestHttp2MaxRequestBodySize {
    let server = ServerBuilder().addr("127.0.0.1").port(0).maxRequestBodySize(1024).tlsConfig(serverConfig()).build()
    var port: UInt16 = 0

    @TestCase
    func maxBodySizeOnHttp2Test(): Unit {
        server.logger.level = LogLevel.WARN
        server
            .distributor
            .register("/upload", {
                ctx =>
                let buf = Array<UInt8>(512, repeat: 0)
                var total: Int64 = 0
                var n = ctx.request.body.read(buf)
                while (n > 0) {
                    total += n
                    n = ctx.request.body.read(buf)
                }
                ctx.responseBuilder.status(200).body("ok ${total}")
            })
        spawn { server.serve() }
        while (server.port == 0) {
            sleep(Duration.millisecond * 10)
        }
        port = server.port

        let client = ClientBuilder().tlsConfig(clientConfig()).build()

        // 1. streaming body within the limit (512 < 1024) is accepted.
        let okResp = client.post("https://127.0.0.1:${port}/upload", StreamingBody(512))
        @Assert(okResp.status, 200)

        // 2. streaming body over the limit (8 * 1024 > 1024) must be rejected.
        //    The server resets the stream with REFUSED_STREAM when the accumulated
        //    DATA frame payload exceeds maxRequestBodySize, so the client request
        //    fails instead of returning 200.
        var rejected = false
        try {
            let overResp = client.post("https://127.0.0.1:${port}/upload", StreamingBody(8 * 1024))
            let buf = Array<UInt8>(1024, repeat: 0)
            while (overResp.body.read(buf) != 0) {}
        } catch (e: Exception) {
            rejected = true
        }
        @Assert(rejected)

        client.close()
        server.close()
        asanGC()
    }
}

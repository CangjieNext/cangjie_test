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
 * Test description: test h2 prop
 *
 * Test API:
 *
 */

package tests.client

import stdx.net.http.*
import stdx.log.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestClientH2 {
    @TestCase
    func testBuildClientH2(): Unit {
        let client = ClientBuilder()
            .tlsConfig(clientConfig())
            .headerTableSize(UInt32(8192))
            .enablePush(false)
            .maxFrameSize(UInt32(2 ** 14))
            .maxHeaderListSize(UInt32(2 ** 20))
            .build()
        @Assert(client.headerTableSize, UInt32(8192))
        @Assert(client.enablePush, false)
        @Assert(client.maxFrameSize, UInt32(2**14))
        @Assert(client.maxHeaderListSize, UInt32(2**20))

        client.close()
    }

    @TestCase
    func testException(): Unit {
        try {
            ClientBuilder().tlsConfig(clientConfig()).initialWindowSize(0).build()
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("InitialWindowSize should between 1 and 2147483647"))
        }
        try {
            ClientBuilder().tlsConfig(clientConfig()).initialWindowSize(UInt32(2 ** 32 - 1)).build()
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("InitialWindowSize should between 1 and 2147483647"))
        }
        try {
            ClientBuilder().tlsConfig(clientConfig()).maxConcurrentStreams(0).build()
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("It is recommended that maxConcurrentStreams be no smaller than 100"))
        }
        try {
            ClientBuilder().tlsConfig(clientConfig()).maxFrameSize(UInt32(2 ** 10)).build()
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("MaxFrameSize should between 2^14 and 2^24-1"))
        }
        try {
            ClientBuilder().tlsConfig(clientConfig()).maxFrameSize(UInt32(2 ** 24)).build()
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("MaxFrameSize should between 2^14 and 2^24-1"))
        }
    }

    static func clientConfig(): TlsClientConfig {
        var tlsConfig = TlsClientConfig()
        tlsConfig.alpnProtocolsList = ["h2"]
        tlsConfig
    }
}

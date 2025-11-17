/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *       Test ServerBuilder
 * Test API:
 *       public func logger(logger: Logger): ServerBuilder
 */

package tests.server

import stdx.net.http.*
import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.time.*
import stdx.log.*
import std.io.*

@Test
class TestCustomizeProtocolServiceFactory {
    @TestCase
    func testCustomize(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).logger(ILogger()).build()

        server
            .distributor
            .register(
                "/hello",
                {
                    ctx =>
                    server.logger.debug("hello debug")
                    server.logger.info("hello info")
                }
            )
        spawn {server.serve()}
        sleep(Duration.millisecond * 200)

        let client = ClientBuilder().build()
        client.get("http://127.0.0.1:${server.port}/hello")
        server.close()
        sleep(Duration.millisecond * 100)
        client.close()
    }
}

class ILogger <: Logger {
    public mut prop level: LogLevel {
        get() {
            return LogLevel.DEBUG
        }
        set(v) {
            // not support
        }
    }
    public func withAttrs(attrs: Array<Attr>): Logger {
        return this
    }
    public func log(record: LogRecord): Unit {
        println("ILogger | INFO | ${record.message}")
    }
    public func setOutput(output: OutputStream): Unit {
        // not support
    }
    public func isClosed(): Bool {
        false
    }
    public func close(): Unit {
    }
}

/* SCAN-IN
ILogger | INFO | hello info
 */

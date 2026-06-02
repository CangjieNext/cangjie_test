/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import stdx.encoding.url.*

@Test
public class Test_logger {
    @TestCase
    func default(): Unit {
        let client = ClientBuilder().build()
        @Expect(client.logger.level.toString(), "INFO")
    }

    @TestCase
    func off(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.OFF
        @Assert(logger.level.toString(), "OFF")
        let client = ClientBuilder().logger(logger).build()
        @Expect(client.logger.level.toString(), "OFF")
    }

    @TestCase
    func error(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.ERROR
        @Assert(logger.level.toString(), "ERROR")
        let client = ClientBuilder().logger(logger).build()
        @Expect(client.logger.level.toString(), "ERROR")
    }

    @TestCase
    func WARN(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.WARN
        @Assert(logger.level.toString(), "WARN")
        let client = ClientBuilder().logger(logger).build()
        @Expect(client.logger.level.toString(), "WARN")
    }

    @TestCase
    func INFO(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.INFO
        @Assert(logger.level.toString(), "INFO")
        let client = ClientBuilder().logger(logger).build()
        @Expect(client.logger.level.toString(), "INFO")
    }

    @TestCase
    func DEBUG(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.DEBUG
        @Assert(logger.level.toString(), "DEBUG")
        let client = ClientBuilder().logger(logger).build()
        @Expect(client.logger.level.toString(), "DEBUG")
    }

    @TestCase
    func TRACE(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.TRACE
        @Assert(logger.level.toString(), "TRACE")
        let client = ClientBuilder().logger(logger).build()
        @Expect(client.logger.level.toString(), "TRACE")
    }

    @TestCase
    func ALL(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.ALL
        @Assert(logger.level.toString(), "ALL")
        let client = ClientBuilder().logger(logger).build()
        @Expect(client.logger.level.toString(), "ALL")
    }
}

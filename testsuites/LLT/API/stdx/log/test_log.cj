/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output --test
// EXEC: %set_stdx_path %run %run_opt %output %run_args

import stdx.log.*
import std.time.DateTime
import std.collection.{HashMap, TreeMap}

@Test
public class LogLevelTest {
    @TestCase
    func compareLogLevel(): Unit {
        @Expect(LogLevel.OFF == LogLevel.OFF)
        @Expect(LogLevel.ALL == LogLevel.ALL)
        @Expect(LogLevel.INFO != LogLevel.ALL)
        @Expect(LogLevel.FATAL != LogLevel.ERROR)
        @Expect(LogLevel.OFF > LogLevel.FATAL)
        @Expect(LogLevel.ERROR > LogLevel.INFO)
        @Expect(LogLevel.ALL < LogLevel.TRACE)
        @Expect(LogLevel.DEBUG < LogLevel.WARN)
        @Expect(LogLevel.OFF >= LogLevel.FATAL)
        @Expect(LogLevel.FATAL >= LogLevel.FATAL)
        @Expect(LogLevel.DEBUG <= LogLevel.WARN)
        @Expect(LogLevel.DEBUG <= LogLevel.DEBUG)
        @Expect(LogLevel.INFO.compare(LogLevel.ERROR), Ordering.LT)
        @Expect(LogLevel.FATAL.compare(LogLevel.DEBUG), Ordering.GT)
        @Expect(LogLevel.WARN.compare(LogLevel.WARN), Ordering.EQ)
    }
}

@Test
public class LogExceptionTest {
    @TestCase
    func initLogException(): Unit {
        let exception1 = LogException()
        let exception2 = LogException("Failed")
        @Expect(exception1.toString(), "LogException")
        @Expect(exception2.toString(), "LogException: Failed")
    }
}

class TestLogWriter <: LogWriter {
    public func writeNone(): Unit {}
    public func writeInt(_: Int64): Unit {}
    public func writeBool(_: Bool): Unit {}
    public func writeFloat(_: Float64): Unit {}
    public func writeString(_: String): Unit {}
    public func writeDateTime(_: DateTime): Unit {}
    public func writeDuration(_: Duration): Unit {}
    public func writeException(_: Exception): Unit {}
    public func writeKey(_: String): Unit {}
    public func writeValue(_: LogValue): Unit {}
    public func startArray(): Unit {}
    public func endArray(): Unit {}
    public func startObject(): Unit {}
    public func endObject(): Unit {}
}

@Test
public class LogValueTest {
    @TestCase
    func testLogValueWriteTo(): Unit {
        let writer = TestLogWriter()
        10i64.writeTo(writer)
        true.writeTo(writer)
        3.14f64.writeTo(writer)
        DateTime.of(year: 2024, month: 10, dayOfMonth: 24).writeTo(writer)
        Duration.second.writeTo(writer)
        "Cangjie".writeTo(writer)
        Exception("Error").writeTo(writer)
        Array<Int64>(5, {i => i}).writeTo(writer)
        HashMap<String, Int64>([("One", 1), ("Two", 2)]).writeTo(writer)
        TreeMap<String, Int64>([("One", 1), ("Two", 2)]).writeTo(writer)
        Some(256i64).writeTo(writer)
        None<Int64>.writeTo(writer)
    }
}

@Test
public class NoopLoggerTest {
    @TestCase
    func testNoopLogger(): Unit {
        let logger = NoopLogger()
        @Expect(logger.level, LogLevel.OFF)
        logger.level = LogLevel.DEBUG
        logger.log(LogRecord(DateTime.now(), LogLevel.DEBUG, "msg", []))
        logger.log(LogLevel.DEBUG, "msg", [])
        logger.log(LogLevel.DEBUG, {=> "msg"}, [])
        logger.withAttrs([])
        @Expect(logger.isClosed(), false)
        logger.close()
    }
}

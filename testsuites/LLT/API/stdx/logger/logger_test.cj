/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.time.*
import std.io.{OutputStream, BufferedOutputStream}
import std.console.Console
import std.fs.*
import std.collection.{HashMap, ArrayList, TreeMap}
import std.sync.{AtomicBool, AtomicInt64, Mutex}
import stdx.log.*
import stdx.logger.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestLog {
    @TestCase
    func testSimpleLogger2(): Unit {
        let tl = SimpleLogger(Console.stdOut)
        tl.level = LogLevel.TRACE
        setGlobalLogger(tl)
        let logger = getGlobalLogger([("name", "test")])
        logger.close()
        @Expect(logger.isClosed())
    }

    @TestCase
    func testSimpleLogger(): Unit {
        let tl = SimpleLogger(Console.stdOut)
        tl.level = LogLevel.TRACE
        setGlobalLogger(tl)
        let logger = getGlobalLogger([("name", "test")])
        logger.debug("abc")
        logger.info("abc")
        logger.fatal("abc")
        logger.level = LogLevel.ERROR
        logger.error("abc")
        logger.trace("abc")
        logger.warn("abc")
        let e = Exception("foo")

        logger.info("abc", ("age", 2))
        let user = User()
        // 记录诊断日志，如果 DEBUG 级别未开启，直接返回，几乎无cost
        logger.debug("Logging in user ${user.name} with birthday ${user.birthdayCalendar}")
        // 普通记录信息日志
        logger.info("Hello, World!", ("k1", [[1, 4], [2, 5], [3]]), ("password", "v22222"))

        // lazy 方式记录耗时日志数据
        logger.log(LogLevel.ERROR, "long-running operation msg", ("k1", 100), ("k2", user.birthdayCalendar),
            ("oper", ToStringWrapper({=> "Some long-running operation returned"})))

        logger.log(LogLevel.ERROR, "long-running operation msg", ("sourcePackage", @sourcePackage()),
            ("sourceFile", @sourceFile()), ("sourceLine", @sourceLine()), ("birthdayCalendar", user.birthdayCalendar),
            ("oper", ToStringWrapper({=> "Some long-running operation returned"})))

        let m = HashMap<String, String>()
        m.add("k1", "1\n")
        m.add("k2", "2")
        m.add("k3", "3")
        logger.trace({=> "Some long-running operation returned"}, ("m1", m))
        let m2 = HashMap<String, LogValue>()
        m2.add("g1", m)
        m2.add("k1", [["\n1", "4 s"], ["2", "5"], ["3"]])

        // 如果TRACE 级别没有开启，那么lambda表达式不会被执行
        logger.trace({=> "Some long-running operation returned"}, ("m2", m2))

        let nl = logger.withAttrs(("processInfo", "1"))
        let none = Option<Int64>.None
        let t = TreeMap<String, String>()
        t.add("k 1", "1\n")
        t.add("k2", "\02")
        t.add("中k3", "3")
        nl.info("msg", ("pi", 3.1415926), ("none", none), ("since", Duration.Zero), ("matrix", [1, 2, 3]), ("obj", m),
            ("tree", t), ("exception", e), ("good-day", true))
        nl.info("nic")
        nl.close()
        logger.close()
    }

    @TestCase
    func testTextLogger(): Unit {
        let tl = TextLogger(Console.stdOut)
        tl.level = LogLevel.TRACE
        setGlobalLogger(tl)
        let logger = getGlobalLogger([("name", "test")])
        logger.debug("abc")
        logger.info("abc")
        logger.fatal("abc")
        logger.level = LogLevel.ERROR
        logger.error("abc")
        logger.trace("abc")
        logger.warn("abc")

        logger.info("abc", ("age", 2))
        let user = User()
        // 记录诊断日志，如果 DEBUG 级别未开启，直接返回，几乎无cost
        logger.debug("Logging in user ${user.name} with birthday ${user.birthdayCalendar}")
        // 普通记录信息日志
        logger.info("Hello, World!", ("k1", [[1, 4], [2, 5], [3]]), ("password", "v22222"))

        // lazy 方式记录耗时日志数据
        logger.log(LogLevel.ERROR, "long-running operation msg", ("k1", 100), ("k2", user.birthdayCalendar),
            ("oper", ToStringWrapper({=> "Some long-running operation returned"})))

        logger.log(LogLevel.ERROR, "long-running operation msg", ("sourcePackage", @sourcePackage()),
            ("sourceFile", @sourceFile()), ("sourceLine", @sourceLine()), ("birthdayCalendar", user.birthdayCalendar),
            ("oper", ToStringWrapper({=> "Some long-running operation returned"})))

        let m = HashMap<String, String>()
        m.add("k1", "1\n")
        m.add("k2", "2")
        m.add("k3", "3")
        logger.trace({=> "Some long-running operation returned"}, ("m1", m))
        let m2 = HashMap<String, LogValue>()
        m2.add("g1", m)
        m2.add("k1", [["1", "4 s"], ["2", "5"], ["3"]])

        // 如果TRACE 级别没有开启，那么lambda表达式不会被执行
        logger.trace({=> "Some long-running operation returned"}, ("m2", m2))

        let nl = logger.withAttrs(("processInfo", "1"))
        nl.info("nic")
        nl.close()
        logger.close()
    }

    @TestCase
    func testJsonLogger(): Unit {
        let tl = JsonLogger(Console.stdOut)
        tl.level = LogLevel.TRACE
        setGlobalLogger(tl)
        let logger = getGlobalLogger([("name", "test")])
        logger.debug("abc")
        logger.info("abc")
        logger.fatal("abc")
        logger.level = LogLevel.ERROR
        logger.error("abc")
        logger.trace("abc")
        logger.warn("abc")

        logger.info("abc", ("age", 2))
        let user = User()
        // 记录诊断日志，如果 DEBUG 级别未开启，直接返回，几乎无cost
        logger.debug("Logging in user ${user.name} with birthday ${user.birthdayCalendar}")
        // 普通记录信息日志
        logger.info("Hello, World!", ("k1", [[1, 4], [2, 5], [3]]), ("password", "v22222"))

        // lazy 方式记录耗时日志数据
        logger.log(LogLevel.ERROR, "long-running operation msg", ("k1", 100), ("k2", user.birthdayCalendar),
            ("oper", ToStringWrapper({=> "Some long-running operation returned"})))

        logger.log(LogLevel.ERROR, "long-running operation msg", ("sourcePackage", @sourcePackage()),
            ("sourceFile", @sourceFile()), ("sourceLine", @sourceLine()), ("birthdayCalendar", user.birthdayCalendar),
            ("oper", ToStringWrapper({=> "Some long-running operation returned"})))

        let m = HashMap<String, String>()
        m.add("k1", "1\n")
        m.add("k2", "2")
        m.add("k3", "3")
        logger.trace({=> "Some long-running operation returned"}, ("m1", m))
        let m2 = HashMap<String, LogValue>()
        m2.add("g1", m)
        m2.add("k1", [["1", "4 s"], ["2", "5"], ["3"]])

        // 如果TRACE 级别没有开启，那么lambda表达式不会被执行
        logger.trace({=> "Some long-running operation returned"}, ("m2", m2))

        let nl = logger.withAttrs(("processInfo", "1"))
        nl.info("nic")
        nl.close()
        logger.close()
    }

    @TestCase
    func testTextLoggerEscapeFormat(): Unit {
        let output = TestOutputStream()
        let tl = TextLogger(output)
        tl.level = LogLevel.TRACE
        setGlobalLogger(tl)
        let logger = getGlobalLogger([("name", "test")])

        logger.info("test\u{0001}injection")
        logger.info("tab\ntest")
        logger.info("quote\"test")
        logger.info("backslash\\test")
        logger.info("control\u{0002}chars\u{0003}")

        let outputStr = output.toString()

        @Expect(outputStr.contains("\\u0001"))
        @Expect(!outputStr.contains("\\u{0001}"))
        @Expect(outputStr.contains("\\n"))
        @Expect(outputStr.contains("\\\""))
        @Expect(outputStr.contains("\\\\"))
        @Expect(outputStr.contains("\\u0002"))
        @Expect(outputStr.contains("\\u0003"))

        logger.close()
    }

    @TestCase
    func testSimpleLoggerStringSlice(): Unit {
        let output = TestOutputStream()
        let tl = SimpleLogger(output)
        tl.level = LogLevel.TRACE
        setGlobalLogger(tl)
        let logger = getGlobalLogger([("name", "test")])

        let originalStr = "hello world ttt"
        let strSlice = originalStr[6..11]

        logger.info("string slice", ("slice", strSlice))

        let outputStr = output.toString()

        @Expect(!outputStr.contains("hello"))
        @Expect(outputStr.contains("world"))
        @Expect(!outputStr.contains("ttt"))

        logger.close()
    }

    @TestCase
    func testLogRecordAttrMutation(): Unit {
        let output1 = TestOutputStream()
        let tl1 = SimpleLogger(output1)
        tl1.level = LogLevel.TRACE
        let logger1 = tl1.withAttrs([("source", "svc1")])

        let output2 = TestOutputStream()
        let tl2 = SimpleLogger(output2)
        tl2.level = LogLevel.TRACE
        let logger2 = tl2.withAttrs([("source", "svc2")])

        let record = LogRecord(DateTime.now(), LogLevel.INFO, "test message", [("key", "val")])

        logger1.log(record)
        logger2.log(record)

        let outputStr1 = output1.toString()
        let outputStr2 = output2.toString()

        @Expect(outputStr1.contains("svc1"))
        @Expect(outputStr1.contains("key"))
        @Expect(outputStr2.contains("svc2"))
        @Expect(!outputStr2.contains("svc1"))

        logger1.close()
        logger2.close()
    }

    @TestCase
    func testTextLoggerMemorySafety(): Unit {
        let output = TestOutputStream()
        let tl = TextLogger(output)
        tl.level = LogLevel.TRACE
        setGlobalLogger(tl)
        let logger = getGlobalLogger([("name", "test")])

        logger.info("")
        logger.info("a")
        logger.info("normal message")
        logger.info("message with spaces and\ttabs")
        logger.info("unicode: 你好世界")
        logger.info("mixed: hello世界123")
        logger.info("long message: " + "A" * 1000)

        let now = DateTime.now()
        logger.info("time test", ("timestamp", now))

        let outputStr = output.toString()
        @Expect(outputStr.contains("normal message"))
        @Expect(outputStr.contains("unicode: 你好世界"))
        @Expect(outputStr.contains("mixed: hello世界123"))
        @Expect(outputStr.contains("long message:"))
        @Expect(outputStr.size > 1000)

        logger.close()
    }

    // Test case 1: CommonLogger withAttrs shares closed state
    // Verifies that withAttrs() creates logger instances that share the same _state,
    // so all clones share the same closed state (per PR #572 implementation)
    @TestCase
    func testCommonLoggerWithAttrsSharesClosedState(): Unit {
        let output = TestOutputStream()
        let tl = TextLogger(output)
        tl.level = LogLevel.TRACE

        // Create loggers via withAttrs (they share the same _state)
        let logger1 = tl.withAttrs([("id", "1")])
        let logger2 = tl.withAttrs([("id", "2")])
        let logger3 = tl.withAttrs([("id", "3")])

        // Initially none should be closed
        @Expect(!tl.isClosed())
        @Expect(!logger1.isClosed())
        @Expect(!logger2.isClosed())
        @Expect(!logger3.isClosed())

        // Close one copy - all should share the closed state
        logger1.close()

        // All loggers share the same _state, so all should be closed
        @Expect(tl.isClosed()) // shared _state is closed
        @Expect(logger1.isClosed()) // logger1 is closed
        @Expect(logger2.isClosed()) // shares _state with logger1
        @Expect(logger3.isClosed()) // shares _state with logger1

        // Test with JsonLogger as well
        let output2 = TestOutputStream()
        let jl = JsonLogger(output2)
        jl.level = LogLevel.TRACE

        let jlLogger1 = jl.withAttrs([("id", "1")])
        let jlLogger2 = jl.withAttrs([("id", "2")])

        @Expect(!jl.isClosed())
        @Expect(!jlLogger1.isClosed())
        @Expect(!jlLogger2.isClosed())

        jlLogger2.close()

        // All share the same _state
        @Expect(jl.isClosed()) // shared _state is closed
        @Expect(jlLogger1.isClosed()) // shares _state with jlLogger2
        @Expect(jlLogger2.isClosed()) // jlLogger2 is closed
    }

    // Test case 2: CommonLogger withAttrs concurrent write safety
    // Verifies that concurrent writes from multiple loggers (created via withAttrs, sharing the same OutputStream) don't lose data
    @TestCase
    func testCommonLoggerWithAttrsConcurrentWriteSafety(): Unit {
        let output = TestOutputStream()
        let tl = TextLogger(output)
        tl.level = LogLevel.TRACE

        let writeCount = AtomicInt64(0)
        let expectedWrites = 100
        let numLoggers = 5

        // Create loggers via withAttrs (they share the same OutputStream)
        let loggers = ArrayList<Logger>()
        loggers.add(tl)
        for (i in 1..numLoggers) {
            loggers.add(tl.withAttrs([("thread", "${i}")]))
        }

        // Concurrently write from all loggers
        let futures = ArrayList<Future<Unit>>()
        for (i in 0..numLoggers) {
            let logger = loggers[i]
            let futures2 = spawn {
                for (j in 0..expectedWrites / numLoggers) {
                    logger.info("thread_${i}_msg_${j}")
                    _ = writeCount.fetchAdd(1)
                }
            }
            futures.add(futures2)
        }

        // Wait for all threads to complete
        for (f in futures) {
            f.get()
        }

        // Verify all writes completed
        @Expect(writeCount.load() == expectedWrites)

        // Verify output contains messages from all threads
        let outputStr = output.toString()
        for (i in 0..numLoggers) {
            @Expect(outputStr.contains("thread_${i}_"))
        }

        tl.close()
    }

    // Test case 3: CommonLogger withAttrs concurrent close safety
    // Verifies that concurrent close calls from multiple loggers (created via withAttrs, sharing the same OutputStream) don't crash
    @TestCase
    func testCommonLoggerWithAttrsConcurrentCloseSafety(): Unit {
        let output = TestOutputStream()
        let tl = TextLogger(output)
        tl.level = LogLevel.TRACE

        // Write some messages first
        tl.info("initial message")

        // Create loggers via withAttrs (they share the same OutputStream)
        let numLoggers = 10
        let loggers = ArrayList<Logger>()
        loggers.add(tl)
        for (i in 1..numLoggers) {
            loggers.add(tl.withAttrs([("id", "${i}")]))
        }

        let closeCount = AtomicInt64(0)

        // Concurrently close all loggers
        let futures = ArrayList<Future<Unit>>()
        for (i in 0..numLoggers) {
            let logger = loggers[i]
            let f = spawn {
                logger.close()
                _ = closeCount.fetchAdd(1)
            }
            futures.add(f)
        }

        // Wait for all close operations
        for (f in futures) {
            f.get()
        }

        // Verify all close calls completed without crashing
        @Expect(closeCount.load() == numLoggers)

        // Verify final closed state is consistent
        @Expect(tl.isClosed())
        for (i in 0..numLoggers) {
            @Expect(loggers[i].isClosed())
        }

        // Verify output contains the initial message
        let outputStr = output.toString()
        @Expect(outputStr.contains("initial message"))

        // Test with JsonLogger as well
        let output2 = TestOutputStream()
        let jl = JsonLogger(output2)
        jl.level = LogLevel.TRACE

        jl.info("json initial message")

        let jlLogger1 = jl.withAttrs([("id", "1")])
        let jlLogger2 = jl.withAttrs([("id", "2")])

        let f1 = spawn {jlLogger1.close()}
        let f2 = spawn {jlLogger2.close()}
        let f3 = spawn {jl.close()}

        f1.get()
        f2.get()
        f3.get()

        @Expect(jl.isClosed())
        @Expect(jlLogger1.isClosed())
        @Expect(jlLogger2.isClosed())

        let outputStr2 = output2.toString()
        @Expect(outputStr2.contains("json initial message"))
    }
}

public class User {
    public prop name: String {
        get() {
            "foo"
        }
    }
    public prop birthdayCalendar: DateTime {
        get() {
            DateTime.now()
        }
    }
}

public class ToStringWrapper <: ToString & LogValue {
    let _fn: () -> String
    public init(fn: () -> String) {
        _fn = fn
    }
    public func toString(): String {
        return _fn()
    }
    public func writeTo(w: LogWriter): Unit {
        w.writeValue(_fn())
    }
}

func expensiveOperation(): String {
    for (i in 0..1) {
        unsafe {
            let b = LibC.malloc<Byte>(count: 1000)
            LibC.free(b)
        }
    }
    "Some long-running operation returned"
}

class TestOutputStream <: OutputStream {
    private let buffer = ArrayList<Byte>()

    public func write(b: Byte): Unit {
        buffer.add(b)
    }

    public func write(bytes: Array<Byte>): Unit {
        buffer.add(all: bytes)
    }

    public func flush(): Unit {}

    public func toString(): String {
        String.fromUtf8(buffer.toArray())
    }
}

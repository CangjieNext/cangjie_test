/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
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
    func testSimpleLoggerMessageInjection(): Unit {
        let output = TestOutputStream()
        let tl = SimpleLogger(output)
        tl.level = LogLevel.TRACE
        setGlobalLogger(tl)
        let logger = getGlobalLogger([("name", "test")])

        let maliciousMsg = "login success\t2026-03-26T10:00:00 FATAL system compromised"
        logger.info(maliciousMsg)

        let outputStr = output.toString()

        @Expect(outputStr.contains("login success"))
        @Expect(outputStr.contains("FATAL system compromised"))
        @Expect(!outputStr.contains("\t"))
        @Expect(outputStr.contains("\\t"))

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

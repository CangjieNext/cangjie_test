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
import cangjie_stdx::log.*
import cangjie_stdx::logger.*
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

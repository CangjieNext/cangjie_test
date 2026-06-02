/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.sync.AtomicBool
import std.time.*
import std.io.{OutputStream, BufferedOutputStream}
import std.console.Console
import std.fs.*
import std.collection.{HashMap, ArrayList, TreeMap}
import stdx.log.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestLog {
    @TestCase
    func testLogInterface(): Unit {
        let logger = getGlobalLogger()
        logger.debug("abc")
        logger.info("abc")
        logger.fatal("abc")
        logger.level = LogLevel.ERROR
        logger.error("abc")
        logger.trace("abc")
        logger.warn("abc")

        logger.debug({=> "abc"})
        logger.info({=> "abc"})
        logger.fatal({=> "abc"})
        logger.error({=> "abc"})
        logger.trace({=> "abc"})
        logger.warn({=> "abc"})

        let nl = logger.withAttrs(("processInfo", "1"))
        nl.info("nic")
    }

    @TestCase
    func testLogLevel(): Unit {
        @Assert(LogLevel.ALL < LogLevel.TRACE)
        @Assert(LogLevel.DEBUG <= LogLevel.INFO)

        @Assert(LogLevel.WARN >= LogLevel.INFO)

        let cl = LogLevel("EMER", 9000)
        cl.compare(LogLevel.ERROR)

        @Assert(cl.toString(), "EMER")
    }

    @TestCase
    func testLogRecord(): Unit {
        let record: LogRecord = LogRecord(DateTime.now(), LogLevel.INFO, "msg")
        let rec2 = record.clone()
        rec2.message = "replaced msg"
        @Assert(rec2.message, "replaced msg")
    }

    @TestCase
    func testLogger(): Unit {
        let e = Exception("foo")
        let m = HashMap<String, String>()
        m.add("k 1", "1\n")
        m.add("k2", "\02")
        m.add("中k3", "3")
        let t = TreeMap<String, String>()
        t.add("k 1", "1\n")
        t.add("k2", "\02")
        t.add("中k3", "3")
        let cl = CommonLogger(Console.stdOut, LogMod.SIMPLE)
        let none = Option<Int64>.None
        cl.info("msg", ("pi", 3.1415926), ("none", none), ("since", Duration.Zero), ("matrix", [1, 2, 3]), ("obj", m),
            ("tree", t), ("exception", e), ("good-day", true))
        cl.close()
    }
}

enum LogMod {
    | SIMPLE
    | TEXT
    | JSON
}

class CommonLogger <: Logger {
    let _attrs = ArrayList<Attr>()
    var _level = LogLevel.INFO
    let _mode: LogMod

    let _closed = AtomicBool(false)
    let o: OutputStream

    public init(output: OutputStream, mode: LogMod) {
        o = output
        _mode = mode
    }

    public mut prop level: LogLevel {
        get() {
            _level
        }
        set(v) {
            _level = v
        }
    }

    public func withAttrs(attrs: Array<Attr>): CommonLogger {
        if (attrs.size > 0) {
            let nl = CommonLogger(o, _mode)
            nl.level = this.level
            nl._attrs.add(all: attrs)
            return nl
        }
        return this
    }

    public func log(record: LogRecord): Unit {
        let _as = this._attrs.clone()
        _as.add(all: record.attrs)
        record.attrs = unsafe { _as.getRawArray() }
    }
    public func isClosed(): Bool {
        _closed.load()
    }
    public func close(): Unit {
        if (isClosed()) {
            return
        }
    }
}

enum LOG_WRITER_STATE {
    | EMPTY_ARRAY
    | NOEMPTY_ARRAY
    | EMPTY_OBJECT
    | NOEMPTY_OBJECT
    | EMPTY_TEXT
    | NOEMPTY_TEXT
}

class TextLogWriter <: LogWriter {
    var out: OutputStream
    var stack: ArrayList<LOG_WRITER_STATE> = ArrayList<LOG_WRITER_STATE>()

    var bo: BufferedOutputStream<OutputStream>
    var haveName = false

    init(out: OutputStream) {
        this.out = out
        stack.add(EMPTY_TEXT)
        bo = BufferedOutputStream(out)
    }
    func writeMessage(v: String): Unit {
        bo.write(unsafe { v.rawData() })
    }
    public func writeNone(): Unit {
        beforeValue()
        bo.write("None".toArray())
    }
    public func writeInt(v: Int64): Unit {
        beforeValue()
        bo.write(v.toString().toArray())
    }
    public func writeBool(v: Bool): Unit {
        beforeValue()
        bo.write(v.toString().toArray())
    }
    public func writeFloat(v: Float64): Unit {
        beforeValue()
        bo.write(v.toString().toArray())
    }
    public func writeString(v: String): Unit {
        beforeValue()
        bo.write([b'"'])
        bo.write(v.toArray())
        bo.write([b'"'])
    }
    public func writeDateTime(v: DateTime): Unit {
        beforeValue()
        bo.write(unsafe { v.toString().rawData() })
    }
    public func writeDuration(v: Duration): Unit {
        beforeValue()
        bo.write(v.toString().toArray())
    }
    public func writeException(v: Exception): Unit {
        writeValue(v.toString())
    }
    public func writeKey(v: String): Unit {
        beforeName()
        haveName = true
        bo.write(v.toArray())
    }
    public func writeValue(lv: LogValue): Unit {
        lv.writeTo(this)
        haveName = false
    }
    public func startArray(): Unit {
        beforeValue()
        bo.write([b'['])
        put(EMPTY_ARRAY)
    }
    public func endArray(): Unit {
        match (top()) {
            case EMPTY_ARRAY | NOEMPTY_ARRAY => bo.write([b']'])
            case _ => throw IllegalStateException("End array must be directly after Start array")
        }
        pop()
    }
    public func startObject(): Unit {
        beforeValue()
        bo.write([b'{'])
        put(EMPTY_OBJECT)
    }
    public func endObject(): Unit {
        if (haveName) {
            throw IllegalStateException("End object cannot directly after a name.")
        }
        match (top()) {
            case EMPTY_OBJECT | NOEMPTY_OBJECT => bo.write([b'}'])
            case _ => throw IllegalStateException("End object must be directly after Start object.")
        }
        pop()
    }

    @OverflowWrapping
    func beforeName(): Unit {
        if (haveName) {
            throw IllegalStateException("Already wrote a name, expecting a value.")
        }
        match (top()) {
            case EMPTY_OBJECT => stack[stack.size - 1] = NOEMPTY_OBJECT
            case NOEMPTY_OBJECT =>
                if (stack.size > 1) {
                    bo.write([b','])
                } else {
                    bo.write([b' '])
                }
            case _ => throw IllegalStateException("The name must be within an object.")
        }
    }

    @OverflowWrapping
    func beforeValue(): Unit {
        match (top()) {
            case NOEMPTY_ARRAY => bo.write([b','])
            case EMPTY_ARRAY => stack[stack.size - 1] = NOEMPTY_ARRAY
            case NOEMPTY_TEXT => throw IllegalStateException("Text must have only one top-level value.")
            case EMPTY_TEXT => stack[stack.size - 1] = NOEMPTY_TEXT
            case EMPTY_OBJECT => stack[stack.size - 1] = NOEMPTY_OBJECT
            case NOEMPTY_OBJECT => // write value in object must write name first
                if (!haveName) {
                    throw IllegalStateException("Value in object must after a name.")
                }
                haveName = false
        }
    }
    func start(): Unit {
        stack.clear()
        bo.flush()
        haveName = false
        put(EMPTY_OBJECT)
    }
    func end(): Unit {
        pop()
    }

    @OverflowWrapping
    func top(): LOG_WRITER_STATE {
        return stack[stack.size - 1]
    }

    @OverflowWrapping
    func put(scope: LOG_WRITER_STATE) {
        stack.add(scope)
    }

    @OverflowWrapping
    func pop(): Unit {
        stack.remove(at: stack.size - 1)
    }
    public func flush(): Unit {
        bo.write([b'\n'])
        bo.flush()
    }
}

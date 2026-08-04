/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args --bench --no-color > log.txt

import std.time.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.io.{OutputStream, BufferedOutputStream}
import std.collection.*
import std.collection.concurrent.{BlockingQueue}
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
@Configure[minDuration: Duration.second]
@Configure[warmup: Duration.second]
@Measure[TimeNow(Nanos)]
public class Test_Log_Level { 
    let bos = BufferedOutputStream(Console.stdOut, 1024*1024)

    var logger: Logger = SimpleLogger(bos)

    @BeforeEach
    func setup() {
        logger = AsyncLogger(SimpleLogger(bos))
        logger.level = LogLevel.ALL
    }
    @AfterEach
    func cleanup() {
        logger.close()
    }

    @Bench
    func BenchmarkLog_Trace() {
        logger.log(LogLevel.TRACE, "打印 TRACE 级别日志！")
    }

    @Bench
    func BenchmarkLog_DEBUG() {
        logger.log(LogLevel.DEBUG, "打印 DEBUG 级别日志！")
    }

    @Bench
    func BenchmarkLog_INFO() {
        logger.log(LogLevel.INFO, "打印 INFO 级别日志！")
    }

    @Bench
    func BenchmarkLog_WARN() {
        logger.log(LogLevel.WARN, "打印 WARN 级别日志！")
    }

    @Bench
    func BenchmarkLog_ERROR() {
        logger.log(LogLevel.ERROR, "打印 ERROR 级别日志！")
    }
}


public class AsyncLogger <: Logger {
    let recordQueue = BlockingQueue<LogRecord>()
    let _attrs = ArrayList<Attr>()
    let _logger: Logger

    let _closed = AtomicBool(false)
    var future: ?Future<Unit> = None

    public init(logger: Logger) {
        this._logger = logger

        future = Some(spawn {
            => worker()
        })
    }

    public mut prop level: LogLevel {
        get() {
            _logger.level
        }
        set(v) {
            _logger.level = v
        }
    }

    public func withAttrs(attrs: Array<Attr>): AsyncLogger {
        if (attrs.size > 0) {
            let nl = this.clone()
            nl._attrs.add(all: attrs)
            return nl
        }
        return this
    }

    public func log(record: LogRecord): Unit {
        let _as = this._attrs.clone()
        _as.add(all: record.attrs)
        record.attrs = unsafe { _as.getRawArray() }
        recordQueue.enqueue(record)
    }
    public func isClosed(): Bool {
        _closed.load()
    }
    public func close(): Unit {
        if (isClosed()) {
            return
        }
        if (_closed.compareAndSwap(false, true)) {
            if (let Some(f) <- future) {
                f.cancel()
                f.get()
            }
            _logger.close()
        }
    }
    func worker(): Unit {
        while (true) {
            match (recordQueue.dequeue(Duration.millisecond * 100)) {
                case Some(rec) => _logger.log(rec)
                case _ => ()
            }
            if (recordQueue.size == 0 && Thread.currentThread.hasPendingCancellation) {
                break
            }
        }
    }
    func clone(): AsyncLogger {
        let cl = AsyncLogger(_logger)
        cl.level = this.level
        cl._attrs.add(all: this._attrs)
        return cl
    }
}
import stdx.log.*
import stdx.logger.SimpleLogger
import std.io.OutputStream
import std.console.*

interface I<T, K, V> {
    mut prop level: LogLevel {
        get() {
            LogLevel.OFF
        }
        set(level_) {
            trace("password")
        }
    }
    func setOutput(output: OutputStream): Unit {}
    func trace(msg: String): Unit {}
    func debug(msg: String): Unit {}
    func info(msg: String): Unit {}
    func warn(msg: String): Unit {}
    func error(msg: String): Unit {}
    func log(level: LogLevel, msg: String): Unit {
        error("password")
    }
}

class MyLogger <: I<Int64, String, SimpleLogger> {
    public func close(): Unit {}
    public func isClosed(): Bool { true }
    public func log(record: LogRecord): Unit {}
    public func withAttrs(attrs: Array<Attr>): Logger { SimpleLogger(Console.stdOut) }
}

main() {
    let logger = SimpleLogger(Console.stdOut)
	logger.trace("hello")
    logger.trace("password")
    let myLogger = MyLogger()
    myLogger.info("password")
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

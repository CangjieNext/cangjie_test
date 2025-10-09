import stdx.log.*
import stdx.logger.SimpleLogger
import std.io.OutputStream
import std.console.*

open class MyLogger<T> <: Logger {
    public mut prop level: LogLevel {
        get() {
            LogLevel.OFF
        }
        set(level_) {
            trace("password")
        }
    }
    public func setOutput(output: OutputStream): Unit {}
    public func trace(msg: String): Unit {}
    public func debug(msg: String): Unit {}
    public func info(msg: String): Unit {}
    public func warn(msg: String): Unit {}
    public func error(msg: String): Unit {}
    public func log(level: LogLevel, msg: String): Unit {
        error("password")
    }
    public func close(): Unit {}
    public func isClosed(): Bool { true }
    public func log(record: LogRecord): Unit {}
    public func withAttrs(attrs: Array<Attr>): Logger { this }
}

main() {
    let logger = SimpleLogger(Console.stdOut)
	logger.trace("hello")
    logger.trace("password")
    let myLogger = MyLogger<Int64>()
    myLogger.info("password")
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

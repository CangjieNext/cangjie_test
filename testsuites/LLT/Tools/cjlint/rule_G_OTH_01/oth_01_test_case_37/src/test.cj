// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.fs.*
internal import stdx.log.*

class FakeLogger {
  public func trace(msg: String): Unit {}
  public func debug(msg: String): Unit {}
  public func info(msg: String): Unit {}
  public func warn(msg: String): Unit {}
  public func error(msg: String): Unit {}
  public func log(level: Int32, msg: String): Unit {}
}

func trace(msg: String): Unit {}
func debug(msg: String): Unit {}
func info(msg: String): Unit {}
func warn(msg: String): Unit {}
func error(msg: String): Unit {}
func log(level: Int32, msg: String): Unit {}

main() {
    let fakeLogger = FakeLogger()
    
    fakeLogger.trace("password")
    fakeLogger.debug("password")
    fakeLogger.info("password")
    fakeLogger.warn("password")
    fakeLogger.error("password")
    fakeLogger.log(1, "password")
    
    trace("password")
    debug("password")
    info("password")
    warn("password")
    error("password")

	
}
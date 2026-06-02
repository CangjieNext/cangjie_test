// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.console.*
internal import stdx.log.*
internal import stdx.logger.*
internal import std.posix.*
internal import std.regex.*
internal import std.io.*

func testA(): Int64 {
    let logger: SimpleLogger = SimpleLogger(Console.stdOut)
    var result = getcwd()
    logger.log(LogLevel.ERROR, "User login succeeded for:" + result) //should throw diagnose
    result = "not external data"
    logger.log(LogLevel.ERROR, "User login succeeded for:" + result)  //should not throw diagnose
    result = getcwd()
    logger.log(LogLevel.ERROR, "User login succeeded for:" + result) //should throw diagnose
    return 0
}
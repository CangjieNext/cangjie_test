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

func test(): Int64 {
    let logger: SimpleLogger = SimpleLogger(Console.stdOut)
    let result = getcwd()
    logger.log(LogLevel.ERROR, "User login succeeded for:" + result)
    var loginSuccessful = true

    match (Regex("[A-Za-z0-9_]+").matcher(result).fullMatch()) {
        case None => logger.log(LogLevel.ERROR, "User login failed for unauthorized user")
        case _ where (loginSuccessful) =>
            logger.log(LogLevel.ERROR, "User login succeeded for:" + result) //should not throw diagnose
        case _ =>
            logger.log(LogLevel.ERROR, "User login failed for:" + result) //should not throw diagnose
    }

    return 0
}
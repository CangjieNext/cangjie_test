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

func testB(): Int64 {
    let logger: SimpleLogger = SimpleLogger(Console.stdOut)
    var result = getcwd()
    var result2 = getcwd()
    var result4 = getcwd()
    var result5 = result4
    var result6 = result5
    logger.log(LogLevel.ERROR, "User login succeeded for:" + getcwd().toString()) //should throw diagnose
    let r = Regex("\\d").matcher(result2)
    var result3 = r.replace("X")
    logger.log(LogLevel.ERROR, "User login succeeded for:" + result3) //should not throw diagnose
    result6 = result5
    logger.log(LogLevel.ERROR, "User login succeeded for:" + result6) //should not throw diagnose
    return 0
}
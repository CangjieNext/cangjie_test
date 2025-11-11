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

main(): Int64 {
    let logger: SimpleLogger = SimpleLogger(Console.stdOut)
    let result = getcwd()
    logger.log(LogLevel.ERROR, getcwd())
    logger.close()
    0
}
// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

internal import p2.*
import stdx.log.*
import stdx.logger.*
import std.env.*

main() {
    // 创建一个SimpleLogger（抽象类Logger的实现类）实例
    let logger = SimpleLogger(getStdOut())

    // 获取当前日志级别
    let currentLevel = logger.level
    println("当前日志级别: ${currentLevel}")
    logger.debug({=> "级别较低，本调试日志不被打印"}, [("type", "debug")])

    // 修改日志级别
    logger.level = LogLevel.DEBUG
    println("修改后的日志级别: ${logger.level}")
    logger.debug({=> "这是一个调试信息"}, [("type", "debug")])
    println("hello world")
    return 0
}
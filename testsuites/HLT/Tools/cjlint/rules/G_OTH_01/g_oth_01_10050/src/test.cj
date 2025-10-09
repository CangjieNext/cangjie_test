import stdx.logger.SimpleLogger
import std.console.*

interface I<T> {
    static func test<K, V>() {
        var a = { =>
            let logger = SimpleLogger(Console.stdOut)
            logger.trace("hello")
            logger.trace("password")
        }
        a
    }
}

main() {
    I<Int64>.test<Int64, Int32>()
    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

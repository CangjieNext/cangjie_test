/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.logger.SimpleLogger
import std.console.*

enum E<T> {
    | A
    func test() {
        let logger = SimpleLogger(Console.stdOut)
        logger.trace("hello")
        logger.trace("password")
    }
}

main() {
    return 0
}

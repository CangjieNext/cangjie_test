/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.console.*
import stdx.logger.*

enum E<T> {
    | A
    func test() {
        let logger = SimpleLogger(Console.stdOut)
        logger.trace("hello")
        logger.trace("psd")
    }
}

main() {
    return 0
}

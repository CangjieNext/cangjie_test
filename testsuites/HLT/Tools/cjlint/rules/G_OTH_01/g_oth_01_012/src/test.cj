import std.log.SimpleLogger

interface I<T> {
    static func test<K, V>() {
        let logger = SimpleLogger()
        logger.trace("hello")
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

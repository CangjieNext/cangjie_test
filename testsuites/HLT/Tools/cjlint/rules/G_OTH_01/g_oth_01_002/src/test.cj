import std.log.SimpleLogger

class A<T> {
    func test() {
        let logger = SimpleLogger()
        logger.trace("hello")
    }
}

main() {
    A<Int64>().test()
    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

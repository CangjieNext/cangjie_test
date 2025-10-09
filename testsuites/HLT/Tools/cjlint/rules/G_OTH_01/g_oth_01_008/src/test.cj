import std.log.SimpleLogger

class A<T> {
}

extend<T> A<T> {
    static func test<K, V>() {
        func test1<K, V>() {
            let logger = SimpleLogger()
            logger.trace("hello")
        }
        test1<Int64, Int32>()
    }
}

main(){
    A<Int64>.test<Int64, Int32>()
    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

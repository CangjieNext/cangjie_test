/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

internal import std.collection.concurrent.*
internal import std.collection.*
internal import std.time.*
internal import std.unittest.*
import std.unittest.testmacro.*
internal import std.sync.*

@Test
class Test_BlockingQueue {
    @TestCase
    func test_init_enqueue_block(): Unit {
        for (size in [1, 5, 9, 20000, 5000000]) {
            let queue = BlockingQueue<Int64>(size)
            for (i in 0..size) {
                @Expect( queue.enqueue(i), true)
            }
            @Expect( queue.size, size)
        }
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --bench
import std.io.*

@Test
class Test_indexOf {
    let byteStream = ByteBuffer()
    var input = BufferedInputStream(byteStream, 1024)
    let buffer = Array<Byte>(1024, repeat: 0)

    @Bench
    func test_buffer_1024() {
        input = BufferedInputStream<ByteBuffer>(byteStream, 1024)
    }

    @Bench
    func test_buffer_1024_reused() {
        input = BufferedInputStream<ByteBuffer>(byteStream, buffer)
    }
}

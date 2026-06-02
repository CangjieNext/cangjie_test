/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../data
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.io.*
import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestBufferedOutputStream {
    @TestCase
    func test_bufferOutputStream_close(): Unit {
        var file = File.create("./data/test2.txt")
        var bos = BufferedOutputStream(file, 32)
        bos.write([96, 97, 98])
        bos.close()
        @Expect(bos.isClosed(), true)

        @Assert(exists("./data/test2.txt"), true)
        var byteRead = File.readFrom("./data/test2.txt")
        @Expect(byteRead.size, 3)
        @Expect(byteRead[0], 96)
        @Expect(byteRead[1], 97)
        @Expect(byteRead[2], 98)
        remove("./data/test2.txt")
    }

    @TestCase
    func test_bufferOutputStream_close_reusebuffer(): Unit {
        let buffer = Array<Byte>(32, repeat: 0)
        var file = File.create("./data/test2.txt")
        var bos = BufferedOutputStream(file, buffer)
        bos.write([96, 97, 98])
        bos.close()
        @Expect(bos.isClosed(), true)

        @Assert(exists("./data/test2.txt"), true)
        var byteRead = File.readFrom("./data/test2.txt")
        @Expect(byteRead.size, 3)
        @Expect(byteRead[0], 96)
        @Expect(byteRead[1], 97)
        @Expect(byteRead[2], 98)

        remove("./data/test2.txt")
    }
}

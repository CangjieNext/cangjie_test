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
class TestBufferedInputStream {
    @TestCase
    func test_bufferInputStream_close(): Unit {
        var file = File("./data/test.txt", Read)
        var bis = BufferedInputStream(file, 32)
        var buf = Array<Byte>(16, repeat: 0)
        var len = bis.read(buf)
        @Expect(len, 4)
        bis.close()
        @Expect(bis.isClosed(), true)
    }

    @TestCase
    func test_bufferInputStream_close_reusebuffer(): Unit {
        let buffer = Array<Byte>(32, repeat: 0)
        var file = File("./data/test.txt", Read)
        var bis = BufferedInputStream(file, buffer)
        var buf = Array<Byte>(16, repeat: 0)
        var len = bis.read(buf)
        @Expect(len, 4)
        bis.close()
        @Expect(bis.isClosed(), true)
    }
}

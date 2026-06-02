/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./zlib_test.txt
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt

import std.collection.*
import stdx.compress.zlib.*
import std.io.ByteBuffer
import std.fs.*

@Test
class CompressOutputStreamTest {
    @TestCase
    func inputBufferEmptyOutputStreamEmpty(): Unit {
        var dest: ByteBuffer = ByteBuffer()
        var compressOutputStream: CompressOutputStream = CompressOutputStream(dest)
        compressOutputStream.write(Array<Byte>())
        compressOutputStream.close()

        @Expect(dest.remainLength, 0)
    }
}

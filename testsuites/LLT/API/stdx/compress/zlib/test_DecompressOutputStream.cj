/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
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
        // 未写入任何压缩数据即关闭：压缩流未完成，close 报告数据不完整
        var dest: ByteBuffer = ByteBuffer()
        var decompressOutputStream: DecompressOutputStream = DecompressOutputStream(dest)
        decompressOutputStream.write(Array<Byte>())
        try {
            decompressOutputStream.close()
            @Assert(false)
        } catch (e: ZlibException) {
            @Expect(e.message, "Unexpected end of compressed data.")
        }
        @Expect(dest.remainLength, 0)
    }

    @TestCase
    func closeTwice(): Unit {
        var dest: ByteBuffer = ByteBuffer()
        var decompressOutputStream: DecompressOutputStream = DecompressOutputStream(dest, bufLen: 256)
        decompressOutputStream.flush()
        try {
            decompressOutputStream.close()
            @Assert(false)
        } catch (e: ZlibException) {
            @Expect(e.message, "Unexpected end of compressed data.")
        }
        // 第二次 close 幂等，直接返回
        decompressOutputStream.close()
    }
}

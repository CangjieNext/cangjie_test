/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.io.*

@Test
public class SeekAfterEndTest {
    // Verify that after seeking beyond the end of data, the read path follows
    // EOF semantics instead of throwing internal exceptions.
    @TestCase
    func readAfterSeekToEndReturnsEof(): Unit {
        let bs = ByteBuffer([1u8, 2u8, 3u8])
        @Expect(bs.seek(End(1)), 4)
        @Expect(bs.readByte(), None)
        let buf = Array<Byte>(4, repeat: 0)
        @Expect(bs.read(buf), 0)
        @Expect(bs.bytes().size, 0)
        let data = readToEnd(bs)
        @Expect(data.size, 0)
    }

    // Verify that seeking back recovers a readable state with intact data.
    @TestCase
    func seekBackRecoversReadableState(): Unit {
        let bs = ByteBuffer([1u8, 2u8, 3u8])
        bs.seek(End(1))
        bs.seek(Begin(0))
        let arr = bs.bytes()
        @Expect(arr == [1u8, 2u8, 3u8], true)
        @Expect(bs.readByte(), Some(1u8))
    }

    // Verify that the write path (hole filling beyond end) still works.
    @TestCase
    func writeBeyondEndStillWorks(): Unit {
        let bs = ByteBuffer([1u8, 2u8, 3u8])
        bs.seek(End(2))
        bs.writeByte(9u8)
        bs.seek(Begin(0))
        let arr = bs.bytes()
        @Expect(arr == [1u8, 2u8, 3u8, 0u8, 0u8, 9u8], true)
    }
}

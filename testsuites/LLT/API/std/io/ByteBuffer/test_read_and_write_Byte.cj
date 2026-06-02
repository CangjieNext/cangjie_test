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
public class readByteTest {
    @TestCase
    func readByteTest(): Unit {
        let bs = ByteBuffer(3)
        @Expect(bs.readByte(), None)
        var data = Array<Byte>(3, repeat: 65)
        bs.write(data)
        @Expect(bs.readByte(), 65)
    }

    @TestCase
    func writeByte(): Unit {
        var bs = ByteBuffer(1)
        @Expect(bs.length, 0)
        bs.writeByte(65)
        @Expect(bs.length, 1)
        @Expect(bs.readByte(), 65)
        bs.writeByte(66)
        @Expect(bs.capacity, 2)
    }
}

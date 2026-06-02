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
public class SeekAbleTest {
    let bs = ByteBuffer()
    let sw = StringWriter<ByteBuffer>(bs)

    @TestCase
    func seekTest(): Unit {
        sw.write("hello,")
        @Expect(sw.length, 6)
        @Expect(sw.remainLength, 6)
        @Expect(sw.position, 0)

        sw.seek(Begin(0))
        @Expect(sw.length, 6)
        @Expect(sw.remainLength, 6)
        @Expect(sw.position, 0)

        sw.write("world!")
        @Expect(sw.length, 12)
        @Expect(sw.remainLength, 12)
        @Expect(sw.position, 0)

        var arr = readToEnd(bs)
        @Expect(String.fromUtf8(arr), "hello,world!")
    }
}

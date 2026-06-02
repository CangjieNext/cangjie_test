/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt
import std.fs.*
import std.io.*

@Test
public class SeekAbleTest {
    let file = File("seek_test.txt", ReadWrite)

    @TestCase
    func seekTest(): Unit {
        @Expect(file.length, 0)
        @Expect(file.remainLength, 0)
        @Expect(file.position, 0)

        file.write("a simple test".toArray())
        @Expect(file.length, 13)
        @Expect(file.remainLength, 0)
        @Expect(file.position, 13)

        file.seek(Current(-4))
        var arr = readToEnd(file)
        @Expect(String.fromUtf8(arr), "test")
        @Expect(file.length, 13)
        @Expect(file.remainLength, 0)
        @Expect(file.position, 13)

        file.seek(Begin(15))
        @Expect(file.length, 13)
        @Expect(file.remainLength, -2)
        @Expect(file.position, 15)

        file.write("for".toArray())
        @Expect(file.length, 18)
        @Expect(file.remainLength, 0)
        @Expect(file.position, 18)

        try {
            file.seek(End(-50))
            @Assert(false)
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to seek"), true)
        }

        file.close()
        remove("seek_test.txt")
    }
}

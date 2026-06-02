/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.io.*
import std.math.*
import std.fs.*

@Test
class Test_File_remainLength {
    @TestCase
    func seekTest(): Unit {
        let file = File("test.txt", ReadWrite)
        @Expect(file.length, 0)
        @Expect(file.remainLength, 0)
        @Expect(file.position, 0)

        file.write("helloworld".toArray())
        @Expect(file.length, 10)
        @Expect(file.remainLength, 0)
        @Expect(file.position, 10)

        file.seek(Current(-5))
        var arr = readToEnd(file)
        @Expect(String.fromUtf8(arr), "world")
        @Expect(file.length, 10)
        @Expect(file.remainLength, 0)
        @Expect(file.position, 10)

        file.seek(Begin(15))
        @Expect(file.length, 10)
        @Expect(file.remainLength, -5)
        @Expect(file.position, 15)

        file.write("for".toArray())
        @Expect(file.length, 18)
        @Expect(file.remainLength, 0)
        @Expect(file.position, 18)

        try {
            file.seek(End(-50))
            @Assert(false)
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to seek"))
        }

        file.write("一に三!@#$".toArray())
        @Expect(file.length, 31)
        @Expect(file.remainLength, 0)
        @Expect(file.position, 31)

        file.close()
        remove("test.txt")
    }
}

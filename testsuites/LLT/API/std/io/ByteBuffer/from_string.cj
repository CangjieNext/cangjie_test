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
class Test_fromString {
    @TestCase
    func fromString_empty_string(): Unit {
        let a = ""
        let stream = ByteBuffer(a.toArray())
        @Expect(readString(stream), "")
    }

    @TestCase
    func fromString_not_empty_string(): Unit {
        let a = "hello"
        let stream = ByteBuffer(a.toArray())
        @Expect(readString(stream), "hello")
    }

    @TestCase
    func fromString_empty_buffer(): Unit {
        let stream = ByteBuffer("".toArray())
        @Expect(readToEnd(stream).size, 0)
    }

    @TestCase
    func fromString_not_empty_buffer(): Unit {
        let stream = ByteBuffer("hello".toArray())
        @Expect(readToEnd(stream), "hello".toArray())
    }

    @TestCase
    func fromString_subString(): Unit {
        let string = "hello, cangjie"
        let stream = ByteBuffer(string[0..5].toArray())
        @Expect(readString(stream), "hello")

        let stream2 = ByteBuffer(string[7..].toArray())
        @Expect(readString(stream2), "cangjie")
    }
}

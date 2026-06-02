/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 
import std.core.*

@Test
class Test_trim {
    @TestCase
    func trim_case01(): Unit {
        let num_array: Array<Int8> = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 6, 7]
        let trim_array01: Array<Int8> = [1, 2, 3, 4, 5]
        let trim_array02: Array<Int8> = [2, 3, 4]
        let trim_array03: Array<Int8> = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 6, 7]
        let trim_array04: Array<Int8> = [5, 6, 7]
        let trim_array05: Array<Int8> = []
        let trim_array06: Array<Int8> = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 6, 7, 8]
        @Expect(num_array.trimStart(trim_array01).toString(), "[6, 7]")
        @Expect(num_array.trimStart(trim_array02).toString(), "[1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 6, 7]")
        @Expect(num_array.trimStart(trim_array03).toString(), "[]")
        @Expect(num_array.trimStart(trim_array05).toString(), "[1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 6, 7]")
        @Expect(num_array.trimStart(trim_array06).toString(), "[]")

        @Expect(num_array.trimEnd(trim_array01).toString(), "[1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 6, 7]")
        @Expect(num_array.trimEnd(trim_array03).toString(), "[]")
        @Expect(num_array.trimEnd(trim_array05).toString(), "[1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 6, 7]")
    }

    @TestCase
    func trim_case02(): Unit {
        let num_array: Array<Bool> = [true, false, true, true, false, false]
        let trim_array01: Array<Bool> = [true]
        let trim_array02: Array<Bool> = [false]
        @Expect(num_array.trimStart(trim_array01).toString(), "[false, true, true, false, false]")
        @Expect(num_array.trimStart(trim_array02).toString(), "[true, false, true, true, false, false]")

        @Expect(num_array.trimEnd(trim_array01).toString(), "[true, false, true, true, false, false]")
        @Expect(num_array.trimEnd(trim_array02).toString(), "[true, false, true, true]")
        let array02 = num_array.trimStart(trim_array01)
        array02[0..] = [false, false, false, false, false]
        @Expect(num_array.toString(), "[true, false, false, false, false, false]")
    }

    @TestCase
    func trim_case03(): Unit {
        let num_array: Array<Byte> = [0xa2, 0xe2, 0x28]
        let trim_array01: Array<Byte> = [0xa2]
        @Expect(num_array.trimStart(trim_array01).toString(), "[226, 40]")
    }

    @TestCase
    func concat_case04(): Unit {
        let num_array: Array<String> = ["hello", ",", "world", "!"]
        let concat_array01: Array<String> = ["仓", "颉"]
        let concat_array02: Array<String> = []
        let concat_array03: Array<String> = [""]
        let concat_array04: Array<String> = [" "]
        @Expect(num_array.concat(concat_array01).toString(), "[hello, ,, world, !, 仓, 颉]")
        @Expect(num_array.concat(concat_array02).toString(), "[hello, ,, world, !]")
        @Expect(num_array.concat(concat_array03).toString(), "[hello, ,, world, !, ]")
        @Expect(num_array.concat(concat_array04).toString(), "[hello, ,, world, !,  ]")
    }
}

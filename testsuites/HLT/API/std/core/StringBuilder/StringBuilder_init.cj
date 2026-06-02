/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.math.*

@Test
class Test_stringBuilder_init {
    @TestCase
    func test_stringBuilder_init(): Unit {
        let str = StringBuilder()
        @Expect(str.size, 0)
        @Expect(str.capacity, 32)
        @Expect(str.toString(), "")
    }

    @TestCase
    func test_stringBuilder_init1(): Unit {
        let str = StringBuilder("你好，仓颉")
        @Expect(str.size, 15)
        @Expect(str.capacity, 47)
        @Expect(str.toString(), "你好，仓颉")
    }

    @TestCase
    func test_stringBuilder_init2(): Unit {
        let str = "你好，仓颉￥%…………%&￥%……&123"
        let strbuild = StringBuilder(str)
        @Expect(strbuild.toString(),str)
        let adde = unsafe { strbuild.appendFromUtf8Unchecked([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
        @Expect(strbuild.size, 56)
        @Expect(strbuild.capacity, 79)
    }
}

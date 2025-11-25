/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC:%set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_encode_decode {
    public func encode01(): Unit {
        let str = "hello123"
        let str_right = URL.encode(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func encode02(): Unit {
        let str = "#$&+,/:;=?@"
        let str_right = URL.encode(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func encode03(): Unit {
        let str = "!'-.*()_~"
        let str_right = URL.encode(str)
        @Assert(str, str_right)
    }

    @TestCase
    public func encode04(): Unit {
        let str = "你好"
        let str_right = URL.encode(str)
        @Assert("%E4%BD%A0%E5%A5%BD", str_right)
    }

    @TestCase
    public func encode05(): Unit {
        let sb = StringBuilder()
        for (i in 0..128) {
            sb.append(Rune(i))
        }
        let str_right = URL.encode(sb.toString())
        @Assert("%00%01%02%03%04%05%06%07%08%09%0A%0B%0C%0D%0E%0F%10%11%12%13%14%15%16%17%18%19%1A%1B%1C%1D%1E%1F%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~%7F", str_right)
    }
}

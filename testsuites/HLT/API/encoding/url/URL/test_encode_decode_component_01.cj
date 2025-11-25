/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class URLEncodeComponent {
    @TestCase
    public func encodeComponent01(): Unit {
        let str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz"
        let str_right = URL.encodeComponent(str)
        println("encode str_right 01: ${str_right}")
        @Assert(str, str_right)
    }

    @TestCase
    public func encodeComponent02(): Unit {
        let str = "#$&+,/:;=?@"
        let str_right = URL.encodeComponent(str)
        println("encode str_right 02: ${str_right}")
        @Assert("%23%24%26%2B%2C%2F%3A%3B%3D%3F%40", str_right)
    }

    @TestCase
    public func encodeComponent03(): Unit {
        let str = "!'-.*()_~"
        let str_right = URL.encodeComponent(str)
        println("encode str_right 03: ${str_right}")
        @Assert(str, str_right)
    }

    @TestCase
    public func encodeComponent04(): Unit {
        let str = "你好"
        let str_right = URL.encodeComponent(str)
        println("encode str_right 04: ${str_right}")
        @Assert("%E4%BD%A0%E5%A5%BD", str_right)
    }

    @TestCase
    public func encodeComponent05(): Unit {
        let sb = StringBuilder()
        for (i in 0..128) {
            sb.append(Rune(i))
        }
        let str_right = URL.encodeComponent(sb.toString())
        @Assert("%00%01%02%03%04%05%06%07%08%09%0A%0B%0C%0D%0E%0F%10%11%12%13%14%15%16%17%18%19%1A%1B%1C%1D%1E%1F%20!%22%23%24%25%26'()*%2B%2C-.%2F0123456789%3A%3B%3C%3D%3E%3F%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~%7F", str_right)
    }

    @TestCase
    public func encodeComponent06(): Unit {
        let str = "https://wwww.example你好.com/zps"
        let str_right = URL.encodeComponent(str)
        println("encode str_right 06: ${str_right}")
        @Assert("https%3A%2F%2Fwwww.example%E4%BD%A0%E5%A5%BD.com%2Fzps", str_right)
    }
}

@Test
class URLDecodeComponent {
    @TestCase
    public func decodeComponent01(): Unit {
        let str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz"
        let str_right = URL.decodeComponent(str)
        println("decode str_right 01: ${str_right}")
        @Assert(str, str_right)
    }

    @TestCase
    public func decodeComponent02(): Unit {
        let str = "%23%24%26%2B%2C%2F%3A%3B%3D%3F%40"
        let str_right = URL.decodeComponent(str)
        println("decode str_right 02: ${str_right}")
        @Assert("#$&+,/:;=?@", str_right)
    }

    @TestCase
    public func decodeComponent03(): Unit {
        let str = "!'-.*()_~"
        let str_right = URL.decodeComponent(str)
        println("decode str_right 03: ${str_right}")
        @Assert(str, str_right)
    }

    @TestCase
    public func decodeComponent04(): Unit {
        let str = "%E4%BD%A0%E5%A5%BD"
        let str_right = URL.decodeComponent(str)
        println("decode str_right 04: ${str_right}")
        @Assert("你好", str_right)
    }

    @TestCase
    public func decodeComponent05(): Unit {
        let sb = StringBuilder()
        for (i in 0..128) {
            sb.append(Rune(i))
        }
        let str = "%00%01%02%03%04%05%06%07%08%09%0A%0B%0C%0D%0E%0F%10%11%12%13%14%15%16%17%18%19%1A%1B%1C%1D%1E%1F%20%21%22%23%24%25%26%27%28%29%2A%2B%2C%2D%2E%2F%30%31%32%33%34%35%36%37%38%39%3A%3B%3C%3D%3E%3F%40%41%42%43%44%45%46%47%48%49%4A%4B%4C%4D%4E%4F%50%51%52%53%54%55%56%57%58%59%5A%5B%5C%5D%5E%5F%60%61%62%63%64%65%66%67%68%69%6A%6B%6C%6D%6E%6F%70%71%72%73%74%75%76%77%78%79%7A%7B%7C%7D%7E%7F"
        let str_right = URL.decodeComponent(str)
        @Assert(sb.toString(), str_right)
    }

    @TestCase
    public func decodeComponent06(): Unit {
        let str = "https%3A%2F%2Fwwww.example%E4%BD%A0%E5%A5%BD.com%2Fzps"
        let str_right = URL.decodeComponent(str)
        println("decode str_right 06: ${str_right}")
        @Assert("https://wwww.example你好.com/zps", str_right)
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan key: connection, values: [keep-alive, close, Upgrade]
// ASSERT: scan key: trailer, values: [abc001]
// ASSERT: scan key: transfer-encoding, values: [Chunked]
// ASSERT: scan key: upgrade, values: [HTTP/2.0]
// ASSERT: scan key: expect, values: [100-continue]
// ASSERT: scan key: authorization, values: [Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==]
// ASSERT: scan key: cookie, values: [$Version=1; Skin=new;]
// ASSERT: scan key: content-length, values: [88888888]
// ASSERT: scan key: connection, values: [keep-alive, close, keep-alive]
// ASSERT: scan key: abcd1, values: [keep-alive]
// ASSERT: scan key: abcd2, values: [keep-alive]
// ASSERT: scan key: abcd3, values: [keep-alive]

/*
 * Test description: Test positive add function
 * Test API: public func add(name: String, value: String): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import stdx.net.http.*

@Test
class Test_Add_01 {
    // name 转小写，value大小写不变
    @TestCase
    func test_add_01(): Unit {
        var header = HttpHeaders()
        var tulple1 = [
            ("connection", "keep-alive"),
            ("connection", "close"),
            ("Connection", "Upgrade"),
            ("Trailer", "abc001"),
            ("Transfer-Encoding", "Chunked"),
            ("Upgrade", "HTTP/2.0"),
            ("Expect", "100-continue"),
            ("Authorization", "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=="),
            ("Cookie", "$Version=1; Skin=new;"),
            ("Content-Length", "88888888")
        ]
        for ((name, value) in tulple1) {
            header.add(name, value)
        }
        for ((k, v) in header) {
            println("key: ${k}, values: ${collectionToArrayList(v)}")
        }
    }

    //name存在，添加相同value成功
    @TestCase
    func test_add_02(): Unit {
        var header = HttpHeaders()
        var tulple1 = [("connection", "keep-alive"), ("connection", "close"), ("Connection", "keep-alive")]
        for ((name, value) in tulple1) {
            header.add(name, value)
        }
        for ((k, v) in header) {
            println("key: ${k}, values: ${collectionToArrayList(v)}")
        }
        @Expect(collectionToArrayList(header.get("connection")), ArrayList<String>(["keep-alive", "close", "keep-alive"]))
    }

    //对value空格的处理:前后删除，中间不处理
    @TestCase
    func test_add_03(): Unit {
        var header = HttpHeaders()
        var tulple1 = [("abcd1", "    keep-alive"), ("abcd2", "keep-alive "), ("abcd3", "  keep-alive  ")]
        for ((name, value) in tulple1) {
            header.add(name, value)
        }
        for ((k, v) in header) {
            println("key: ${k}, values: ${collectionToArrayList(v)}")
            @Expect(collectionToArrayList(v), ArrayList<String>.of("keep-alive"))
        }
        header.add("abcd4", "  keep- alive  ")
        @Expect(collectionToArrayList(header.get("abcd4")), ArrayList<String>(["keep- alive"]))
    }

    //长度限制:server读的时候headers整体有限制，单个name、value没有限制;client 暂时没做限制
    @TestCase
    func test_add_04(): Unit {
        var str = String(Array<Rune>(1024 * 1024, repeat: r'a'))
        var header = HttpHeaders()
        header.add(str, str)
        @Expect(collectionToArrayList(header.get(str)), ArrayList<String>([str]))
    }

    //个数限制: 无
    @TestCase
    func test_add_05(): Unit {
        var header = HttpHeaders()
        var str = "a"
        for (_ in 0..100000) {
            header.add(str, str)
        }
        var res = header.get(str)
        @Expect(res.size, 100000)
    }

    //token字符：！， #， $， %， &， ', *, +, -, ., ^, _, `, |, ~, 
    // 1~9, a~z
    @TestCase
    func test_add_06(): Unit {
        var header = HttpHeaders()
        var names = ["!", "#", "$", "%", "&", "'", "*", "+", "-", ".", "^", "_", "`", "|", "~", "1234567890",
            "qwertyuiopasdfghjklzxcvbnm", "QWERTYUIOPASDFGHJKLZXCVBNMa"]
        for (name in names) {
            header.add(name, name)
            @Expect(collectionToArrayList(header.get(name)), ArrayList<String>([name]))
        }
    }
}

func collectionToArrayList(collection: Collection<String>): ArrayList<String> {
    let arr = ArrayList<String>()
    for (str in collection) {
        arr.add(str)
    }
    return arr
}

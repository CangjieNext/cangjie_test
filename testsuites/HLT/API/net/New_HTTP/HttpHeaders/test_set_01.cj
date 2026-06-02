/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test positive set function
 * Test API: public func set(name: String, values: ArrayList<String>): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import stdx.net.http.*

@Test
class Test_Set_01 {
    // name 不存在时set
    @TestCase
    func test_set_01(): Unit {
        var header = HttpHeaders()
        header.set("123", "123")
        header.set("456", "456")
        @Expect(collectionToArrayList(header.get("123")), ArrayList<String>.of("123"))
        @Expect(collectionToArrayList(header.get("456")), ArrayList<String>.of("456"))
    }

    // name 存在时set
    @TestCase
    func test_set_02(): Unit {
        var header = HttpHeaders()
        header.add("123", "123")
        header.add("123", "456")
        @Expect(collectionToArrayList(header.get("123")), ArrayList<String>.of("123", "456"))
    }

    //对value空格的处理:前后删除，中间不处理
    @TestCase
    func test_set_03(): Unit {
        var header = HttpHeaders()
        var values = ArrayList<String>(["    keep-alive", "keep-alive ", "  keep-alive  ", "keep- alive"])
        var values_1 = ArrayList<String>(["keep-alive", "keep-alive", "keep-alive", "keep- alive"])
        for (value in values) {
            header.add("connect", value)
        }
        @Expect(collectionToArrayList(header.get("connect")), values_1)
    }

    //长度限制:server读的时候headers整体有限制，单个name、value没有限制;client 暂时没做限制
    @TestCase
    func test_set_04(): Unit {
        var str = String(Array<Rune>(1024, repeat: r'a'))
        var arr = ArrayList<String>(1024)
        var header = HttpHeaders()
        for (_ in 0..1024) {
            arr.add(str)
            header.add(str, str)
        }
        @Expect(collectionToArrayList(header.get(str)), arr)
    }

    //token字符：！， #， $， %， &， ', *, +, -, ., ^, _, `, |, ~, 
    // 1~9, a~z
    @TestCase
    func test_set_05(): Unit {
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

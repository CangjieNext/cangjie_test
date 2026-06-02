/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC:%set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.encoding.url.*
import std.collection.*

@Test
class FormTest {
    @TestCase
    func formInit(): Unit {
        var form = Form()
        @Expect(form.isEmpty(), true)

        form = Form("1=123&1=abc&2=123&2=abc&2=wefgqa")
        @Expect(form.isEmpty(), false)

        var cloneform = form.clone()
        @Expect(cloneform.toEncodeString() == form.toEncodeString())
    }

    @TestCase[str in [ "%Q2%2G=**", "%28%39=%2", "%28%3=%26" ] 
]
    func formInitError(str: String): Unit {
        try {
            Form(str)
            @Expect(false)
        } catch (e: UrlSyntaxException) {
            @Expect((e.message).contains("Invalid URL escape"))
        }
    }

    @TestCase
    func formToEncodeString(): Unit {
        var form = Form()
        @Expect(form.toEncodeString(), "")

        form = Form("=")
        @Expect(form.toEncodeString(), "=")

        form = Form("Af-._~=123Bc-._~")
        @Expect(form.toEncodeString(), "Af-._~=123Bc-._~")

        form = Form("!$&'( )*+,;=:@?/\\\"#%24][^`{|}中%E4%B8%AD=:@?/\\\"#%2B")
        @Expect(form.toEncodeString(), "%21%24=&%27%28+%29%2A+%2C%3B=%3A%40%3F%2F%5C%22%23%24%5D%5B%5E%60%7B%7C%7D%E4%B8%AD%E4%B8%AD%3D%3A%40%3F%2F%5C%22%23%2B")
    }

    @TestCase
    func getformValue(): Unit {
        var form = Form("a=1&b&c=2")
        @Expect(form.get("a"), "1")
        @Expect(form.get("b"), "")
        @Expect(form.get("c"), "2")
        @Expect(form.get("d"), None)
    }

    @TestCase
    func getAllformValue(): Unit {
        var form = Form("a=1&b&a=2&a=3")
        var expect = ArrayList<String>(["1", "2", "3"])
        var result = form.getAll("a")
        @Expect(expect.size == result.size)
        for (i in 0..expect.size) {
            @Expect(expect[i], result[i])
        }

        expect = ArrayList<String>()
        result = form.getAll("c")
        @Expect(expect.size == result.size)
    }

    @TestCase
    func setFormValue(): Unit {
        var form = Form("a=1&b&a=2&a=3")
        form.set("a", "4")
        var result = form.getAll("a")
        @Expect(result.size == 1)
        @Expect(result[0] == "4")

        form.set("c", "5")
        @Expect(form.get("c"), "5")
    }

    @TestCase
    func addFormValue(): Unit {
        var form = Form("a=1&b&a=2&a=3")
        form.add("a", "4")
        var expect = ArrayList<String>(["1", "2", "3", "4"])
        var result = form.getAll("a")
        @Expect(expect.size == result.size)
        for (i in 0..expect.size) {
            @Expect(expect[i], result[i])
        }

        form.add("c", "5")
        @Expect(form.get("c"), "5")
    }

    @TestCase
    func removeFormValue(): Unit {
        var form = Form("a=1&b&a=2&a=3")
        form.remove("a")
        @Expect(form.get("a"), None)
    }
}

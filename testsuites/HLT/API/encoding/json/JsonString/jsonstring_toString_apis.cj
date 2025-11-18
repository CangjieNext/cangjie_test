/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import stdx.encoding.json.*

@Test
class Test_JsonString_toJsonString_toString {
    @TestCase
    func test_tojsonstring_01(): Unit {
        @Expect(JsonString("Hello &lt;world&gt;!").toString(), ##""Hello \u0026lt;world\u0026gt;!""##)
        @Expect(JsonString("Hello &lt;world&gt;!").toJsonString(), ##""Hello \u0026lt;world\u0026gt;!""##)
        @Expect(JsonString("Hello &lt;world&gt;!").toStringWithoutEscaping(), "\"Hello &lt;world&gt;!\"")
        @Expect(JsonString("Hello &lt;world&gt;!").toJsonStringWithoutEscaping(), "\"Hello &lt;world&gt;!\"")
    }

    @TestCase
    func test_tojsonstring_02(): Unit {
        let jsonstr = JsonString("I love &lt;em&gt;coding&lt;/em&gt; and &quot;learning&quot; new @ things.")
        @Expect(jsonstr.toString(), ##""I love \u0026lt;em\u0026gt;coding\u0026lt;/em\u0026gt; and \u0026quot;learning\u0026quot; new @ things.""##)
        @Expect(jsonstr.toJsonString(), ##""I love \u0026lt;em\u0026gt;coding\u0026lt;/em\u0026gt; and \u0026quot;learning\u0026quot; new @ things.""##)
        @Expect(jsonstr.toStringWithoutEscaping(), "\"I love &lt;em&gt;coding&lt;/em&gt; and &quot;learning&quot; new @ things.\"")
        @Expect(jsonstr.toJsonStringWithoutEscaping(), "\"I love &lt;em&gt;coding&lt;/em&gt; and &quot;learning&quot; new @ things.\"")
    }
}

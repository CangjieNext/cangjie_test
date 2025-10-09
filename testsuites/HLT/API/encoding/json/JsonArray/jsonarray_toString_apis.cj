/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import stdx.encoding.json.*

@Test
class Test_JsonArray_toJsonString_toString {
    @TestCase
    func test_tojsonstring_01(): Unit {
        let jsonarray = JsonValue
            .fromStr(##"["react", "&lt;ui&gt;", "&quot;design&quot;", "&apos;mobile&apos;"]"##)
            .asArray()
        @Expect(jsonarray.toString(), ##"["react","\u0026lt;ui\u0026gt;","\u0026quot;design\u0026quot;","\u0026apos;mobile\u0026apos;"]"##)
        @Expect(jsonarray.toJsonString(), ##"[
  "react",
  "\u0026lt;ui\u0026gt;",
  "\u0026quot;design\u0026quot;",
  "\u0026apos;mobile\u0026apos;"
]"##)
        @Expect(jsonarray.toStringWithoutEscaping(), ##"["react","&lt;ui&gt;","&quot;design&quot;","&apos;mobile&apos;"]"##)
        @Expect(jsonarray.toJsonStringWithoutEscaping(), ##"[
  "react",
  "&lt;ui&gt;",
  "&quot;design&quot;",
  "&apos;mobile&apos;"
]"##)
        @Expect(jsonarray.toJsonStringWithoutEscaping(0, bracketInNewLine: true), ##"[
  "react",
  "&lt;ui&gt;",
  "&quot;design&quot;",
  "&apos;mobile&apos;"
]"##)
        @Expect(jsonarray.toJsonStringWithoutEscaping(0, indent: "\t"), """
[
\t"react",
\t"&lt;ui&gt;",
\t"&quot;design&quot;",
\t"&apos;mobile&apos;"
]""")
        @Expect(jsonarray.toJsonStringWithoutEscaping(1, bracketInNewLine: true, indent: "    "), ##"    [
        "react",
        "&lt;ui&gt;",
        "&quot;design&quot;",
        "&apos;mobile&apos;"
    ]"##)
    }
}

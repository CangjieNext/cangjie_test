/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.encoding.json.*

@Test
class Test_JsonObject_toJsonString_toString {
    @TestCase
    func test_tojsonstring_01(): Unit {
        let jsonobject = JsonValue
            .fromStr(
                ##"{
  "user": {
    "name": "Alice &amp; Bob",
    "email": "alice@domain.com",
    "bio": "I love &lt;em&gt;coding&lt;/em&gt; and &quot;learning&quot; new things."
  },
  "tags": ["react", "&lt;ui&gt;", "&quot;design&quot;", "&apos;mobile&apos;"]
}"##)
            .asObject()

        @Expect(jsonobject.toString(), ##"{"user":{"name":"Alice \u0026amp; Bob","email":"alice@domain.com","bio":"I love \u0026lt;em\u0026gt;coding\u0026lt;/em\u0026gt; and \u0026quot;learning\u0026quot; new things."},"tags":["react","\u0026lt;ui\u0026gt;","\u0026quot;design\u0026quot;","\u0026apos;mobile\u0026apos;"]}"##)
        @Expect(jsonobject.toJsonString(), ##"{
  "user": {
    "name": "Alice \u0026amp; Bob",
    "email": "alice@domain.com",
    "bio": "I love \u0026lt;em\u0026gt;coding\u0026lt;/em\u0026gt; and \u0026quot;learning\u0026quot; new things."
  },
  "tags": [
    "react",
    "\u0026lt;ui\u0026gt;",
    "\u0026quot;design\u0026quot;",
    "\u0026apos;mobile\u0026apos;"
  ]
}"##)
        @Expect(jsonobject.toStringWithoutEscaping(), ##"{"user":{"name":"Alice &amp; Bob","email":"alice@domain.com","bio":"I love &lt;em&gt;coding&lt;/em&gt; and &quot;learning&quot; new things."},"tags":["react","&lt;ui&gt;","&quot;design&quot;","&apos;mobile&apos;"]}"##)
        @Expect(jsonobject.toJsonStringWithoutEscaping(), ##"{
  "user": {
    "name": "Alice &amp; Bob",
    "email": "alice@domain.com",
    "bio": "I love &lt;em&gt;coding&lt;/em&gt; and &quot;learning&quot; new things."
  },
  "tags": [
    "react",
    "&lt;ui&gt;",
    "&quot;design&quot;",
    "&apos;mobile&apos;"
  ]
}"##)
        @Expect(jsonobject.toJsonStringWithoutEscaping(0, bracketInNewLine: true), ##"{
  "user": {
    "name": "Alice &amp; Bob",
    "email": "alice@domain.com",
    "bio": "I love &lt;em&gt;coding&lt;/em&gt; and &quot;learning&quot; new things."
  },
  "tags": [
    "react",
    "&lt;ui&gt;",
    "&quot;design&quot;",
    "&apos;mobile&apos;"
  ]
}"##)
        @Expect(jsonobject.toJsonStringWithoutEscaping(0, indent: "\t"), """
{
\t"user": {
\t\t"name": "Alice &amp; Bob",
\t\t"email": "alice@domain.com",
\t\t"bio": "I love &lt;em&gt;coding&lt;/em&gt; and &quot;learning&quot; new things."
\t},
\t"tags": [
\t\t"react",
\t\t"&lt;ui&gt;",
\t\t"&quot;design&quot;",
\t\t"&apos;mobile&apos;"
\t]
}""")
        @Expect(jsonobject.toJsonStringWithoutEscaping(1, bracketInNewLine: true, indent: "    "), ##"    {
        "user": {
            "name": "Alice &amp; Bob",
            "email": "alice@domain.com",
            "bio": "I love &lt;em&gt;coding&lt;/em&gt; and &quot;learning&quot; new things."
        },
        "tags": [
            "react",
            "&lt;ui&gt;",
            "&quot;design&quot;",
            "&apos;mobile&apos;"
        ]
    }"##)
    }
}

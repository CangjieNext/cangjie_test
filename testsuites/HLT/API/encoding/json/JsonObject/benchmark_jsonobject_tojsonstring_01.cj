/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix --bench %run_args

import stdx.encoding.json.*
import std.runtime.*

@Test
class Test_JsonObject_toJsonString_toString {
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
    @Bench
    func test_tojsonstring_01(): Unit {
        blackBox(jsonobject.toString())
    }

    @Bench
    func test_tojsonstring_02(): Unit {
        blackBox(jsonobject.toJsonString())
    }

    @Bench
    func test_tojsonstring_03(): Unit {
        blackBox(jsonobject.toStringWithoutEscaping())
    }

    @Bench
    func test_tojsonstring_04(): Unit {
        blackBox(jsonobject.toJsonStringWithoutEscaping())
    }
}

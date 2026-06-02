/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass01 pass02 pass03 pass04
import stdx.encoding.json.*
import std.collection.*

main() {
    var jv01: JsonValue = JsonArray()
    var jv02: JsonValue = JsonObject()
    if (jv01.toString() == "[]") {
        print("pass01 ")
    } else {
        print("fail01 ")
    }
    if (jv02.toString() == "{}") {
        print("pass02 ")
    } else {
        print("fail02 ")
    }
    var a: JsonValue = JsonNull()
    var b: JsonValue = JsonBool(true)
    var c: JsonValue = JsonBool(false)
    var d: JsonValue = JsonInt(7363)
    var e: JsonValue = JsonFloat(736423.546)
    var list: ArrayList<JsonValue> = ArrayList<JsonValue>()
    var list2: ArrayList<JsonValue> = ArrayList<JsonValue>()
    var map = JsonObject()
    var map1 = JsonObject()
    map1.put("a", JsonString("jjjjjj"))
    map1.put("b", b)
    map1.put("c", JsonString("hhhhh"))
    list2.add(b)
    list2.add(JsonInt(3333333))
    list2.add(map1)
    list2.add(JsonString("sdfghgfasd"))
    list.add(b)
    list.add(a)
    list.add(map)
    list.add(c)
    list.add(JsonArray(list2))
    list.add(d)
    list.add(JsonString("ddddddd"))
    list.add(e)
    var result: JsonValue = JsonArray(list)
    var expect01: String = ##"[
  true,
  null,
  {},
  false,
  [
    true,
    3333333,
    {
      "a": "jjjjjj",
      "b": true,
      "c": "hhhhh"
    },
    "sdfghgfasd"
  ],
  7363,
  "ddddddd",
  736423.546
]"##
    if (result.toJsonString() == expect01) {
        print("pass03 ")
    } else {
        print("fail03 ")
    }
    var expect02: String = "[\n  true,\n  null,\n  {},\n  false,\n  [\n    true,\n    3333333,\n    {\n      \"a\": \"jjjjjj\",\n      \"b\": true,\n      \"c\": \"hhhhh\"\n    },\n    \"sdfghgfasd\"\n  ],\n  7363,\n  \"ddddddd\",\n  736423.546\n]"
    if (result.toJsonString() == expect02) {
        print("pass04 ")
    } else {
        print("fail04 ")
    }
    0
}

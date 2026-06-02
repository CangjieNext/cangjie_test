/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: creat_data.cj
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %stdx-package  creat_data.cj -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan test_init_ok test_toString_ok test_toJsonString_ok test_empty_containsKey_ok test_put_ok test_containsKey_ok test_error_containsKey_ok test_get_ok test_get_ok test_getFields_ok test_toString_ok test_toJosnString_ok

import stdx.encoding.json.*
import std.collection.*

main(): Int64 {
    var hashMap = HashMap<String, JsonValue>([("key1", creatJsonValue(-1, 1, "i"))])
    var initFunc = JsonObject(hashMap)
    var caseClass = TestJsonObject()
    if (caseClass.testInit(initFunc, exp_size: 1) == 0) {
        print("test_init_ok ")
    }

    // toString
    var exp_str = "{\"key1\":{\"item1\":-1,\"item2\":1,\"item3\":\"i\"}}"
    if (caseClass.testToString(initFunc, exp_str) == 0) {
        print("test_toString_ok ")
    }

    // toJsonString
    var exp_jsonstr1 = ##"{
  "key1": {
    "item1": -1,
    "item2": 1,
    "item3": "i"
  }
}"##
    if (caseClass.testToJsonString(initFunc, exp_jsonstr1) == 0) {
        print("test_toJsonString_ok ")
    }

    // containsKey
    if (caseClass.testContainsKey(initFunc, ["key1"], true) == 0) {
        print("test_empty_containsKey_ok ")
    }

    // put
    if (caseClass.testPut(initFunc, "key2", creatJsonValue(-2, 2, "j")) == 0) {
        print("test_put_ok ")
    }

    // containsKey
    if (caseClass.testContainsKey(initFunc, ["key2"], true) == 0) {
        print("test_containsKey_ok ")
    }

    // containsKey
    if (caseClass.testContainsKey(initFunc, ["error key"], false) == 0) {
        print("test_error_containsKey_ok ")
    }

    // get 
    var exp_value1 = "{\"item1\":-1,\"item2\":1,\"item3\":\"i\"}"
    var exp_value2 = "{\"item1\":-2,\"item2\":2,\"item3\":\"j\"}"
    if (caseClass.testGet(initFunc, "key1", exp_value1) == 0) {
        print("test_get_ok ")
    }
    if (caseClass.testGet(initFunc, "key2", exp_value2) == 0) {
        print("test_get_ok ")
    }

    // getFields
    var exp_field = HashMap<String, JsonValue>([("key1", creatJsonValue(-1, 1, "i")), ("key2", creatJsonValue(-2, 2, "j"))])
    if (caseClass.testGetFields(initFunc, exp_field) == 0) {
        print("test_getFields_ok ")
    }

    // toString
    var exp_str2 = "{\"key1\":{\"item1\":-1,\"item2\":1,\"item3\":\"i\"},\"key2\":{\"item1\":-2,\"item2\":2,\"item3\":\"j\"}}"
    if (caseClass.testToString(initFunc, exp_str2) == 0) {
        print("test_toString_ok ")
    }

    var exp_jsonstr = ##"{
  "key1": {
    "item1": -1,
    "item2": 1,
    "item3": "i"
  },
  "key2": {
    "item1": -2,
    "item2": 2,
    "item3": "j"
  }
}"##
    if (caseClass.testToJsonString(initFunc, exp_jsonstr) == 0) {
        print("test_toJosnString_ok")
    }

    return 0
}

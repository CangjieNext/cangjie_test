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
// ASSERT: scan pass1 pass2 pass3 pass4 pass5 pass6 pass7 pass8 pass9 pass10 pass11

import stdx.encoding.json.*
import std.collection.*

main(): Int64 {
    // init()
    var initFunc = JsonObject()
    var caseClass = TestJsonObject()
    if (caseClass.testInit(initFunc) == 0) {
        print("pass1 ")
    }

    // toString
    if (caseClass.testToString(initFunc, "{}") == 0) {
        print("pass2 ")
    }

    // toJsonString
    if (caseClass.testToJsonString(initFunc, "{}") == 0) {
        print("pass3 ")
    }

    // containsKey
    if (caseClass.testContainsKey(initFunc, Array<String>(), true) == 0) {
        print("pass4 ")
    }

    // put
    if (caseClass.testPut(initFunc, "key1", creatJsonValue(-1, 1, "this is item")) == 0) {
        print("pass5 ")
    }

    // containsKey 非空key
    if (caseClass.testContainsKey(initFunc, ["key1"], true) == 0) {
        print("pass6 ")
    }

    // containsKey 空key
    if (caseClass.testContainsKey(initFunc, ["error key"], false) == 0) {
        print("pass7 ")
    }

    // get 
    var exp_value = "{\"item1\":-1,\"item2\":1,\"item3\":\"this is item\"}"
    if (caseClass.testGet(initFunc, "key1", exp_value) == 0) {
        print("pass8 ")
    }

    // getFields
    var exp_field = HashMap<String, JsonValue>([("key1", creatJsonValue(-1, 1, "this is item"))])
    if (caseClass.testGetFields(initFunc, exp_field) == 0) {
        print("pass9 ")
    }

    // toString
    var exp_str = "{\"key1\":{\"item1\":-1,\"item2\":1,\"item3\":\"this is item\"}}"
    if (caseClass.testToString(initFunc, exp_str) == 0) {
        print("pass10 ")
    }

    var exp_jsonstr = ##"{
  "key1": {
    "item1": -1,
    "item2": 1,
    "item3": "this is item"
  }
}"##
    if (caseClass.testToJsonString(initFunc, exp_jsonstr) == 0) {
        print("pass11")
    }

    return 0
}

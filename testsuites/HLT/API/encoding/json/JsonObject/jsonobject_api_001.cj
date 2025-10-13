/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: create_jsonobject_data.cj
// EXEC-PIPE: %compiler %import-cangjie-stdx %cmp_opt %f create_jsonobject_data.cj -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args
import stdx.encoding.json.*

main(): Int64 {
    var init1 = JsonObject()
    var cases = Testjsonobject()
    if (cases.testinit(init1) != 0) {
        println("case 1")
        return 1
    }
    if (cases.testtoString(init1, "{}") != 0) //空jsonObject
    {
        println("case 2")
        return 1
    }
    if (cases.testjsonString(init1, "{}") != 0) //空jsonObject
    {
        println("case 3")
        return 1
    }
    if (cases.testcontainsKey(init1, Array<String>(), true) != 0) //空jsonObject
    {
        println("case 4")
        return 1
    }
    //testput(json:JsonObject,key: String, v: JsonValue):Int64
    if (cases.testput(init1, "key1", createjsonvalue(-1, 5, "key1")) != 0) //空jsonObject
    {
        println("case 5")
        return 1
    }
    if (cases.testcontainsKey(init1, ["key1"], true) != 0) //非空jsonObject
    {
        println("case 6")
        return 1
    }
    if (cases.testcontainsKey(init1, ["error_key"], false) != 0) //非空jsonObject
    {
        println("case 7")
        return 1
    }
    //testget(json:JsonObject,key:String,exp_value:String):Int64
    var exp_get_value = "{\"fieldTemp1\":-1,\"fieldTemp2\":5,\"fieldTemp3\":\"key1\"}"
    if (cases.testget(init1, "key1", exp_get_value) != 0) {
        println("case 8")
        return 1
    }
    //testgetFields(json:JsonObject,exp_field:HashMap<String,JsonValue>):Int64
    var exp_field = HashMap<String, JsonValue>([("key1", createjsonvalue(-1, 5, "key1"))])
    if (cases.testgetFields(init1, exp_field) != 0) {
        println("case 9")
        return 1
    }
    var exp_str = "{\"key1\":{\"fieldTemp1\":-1,\"fieldTemp2\":5,\"fieldTemp3\":\"key1\"}}"
    if (cases.testtoString(init1, exp_str) != 0) //非空jsonObject
    {
        println("case 10")
        return 1
    }
    var exp_jsonstr = """
{
  \"key1\": {
    \"fieldTemp1\": -1,
    \"fieldTemp2\": 5,
    \"fieldTemp3\": \"key1\"
  }
}"""
    if (cases.testjsonString(init1, exp_jsonstr) != 0) //非空jsonObject
    {
        println("case 11")
        return 1
    }

    return 0
}

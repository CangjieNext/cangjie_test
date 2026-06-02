/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args

import stdx.serialization.serialization.*
import std.math.*
import stdx.encoding.json.*

class Testjsonbool {
    //init(bv:Bool);func toString() : String;func toJsonString() : String
    public func testinit(jsonbool: JsonBool, exp_str: String, exp_jsonstr: String): Int64 {
        var toString = jsonbool.toString()
        if (toString != exp_str) {
            println("toString=" + toString)
            return 1
        }
        var toJsonString = jsonbool.toJsonString()
        if (toJsonString != exp_jsonstr) {
            println("toJsonString=" + toJsonString)
            return 2
        }
        return 0
    }
    //func getValue(): Bool;
    public func testgetValue(jsonbool: JsonBool, exp_re: Bool): Int64 {
        var re = jsonbool.getValue()
        if (re != exp_re) {
            print("exp=")
            println(exp_re)
            print("re=")
            println(re)
            return 1
        }
        return 0
    }
}

main(): Int64 {
    var jsonb1 = JsonBool(true)
    var jsonb2 = JsonBool(false)
    var cases = Testjsonbool()
    if (cases.testinit(jsonb1, "true", "true") != 0) {
        println("case 1 fail")
        return 1
    }
    if (cases.testgetValue(jsonb1, true) != 0) {
        println("case 2 fail")
        return 1
    }
    if (cases.testinit(jsonb2, "false", "false") != 0) {
        println("case 3 fail")
        return 1
    }
    if (cases.testgetValue(jsonb2, false) != 0) {
        println("case 4 fail")
        return 1
    }
    return 0
}

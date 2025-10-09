/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
internal import stdx.encoding.json.*
internal import std.collection.*

class Testjsonstring {
    /*
            init(sv: String);
            func getValue(): String;
            func toString(): String;
            func toJsonString() : String
     */
    //init()
    public func testinit(json: JsonString, exp_str_g: String, exp_str_ts: String, exp_str_tj: String): Int64 {
        var re_getValue = json.getValue()
        var re_toString = json.toString()
        var re_toJsonString = json.toJsonString()
        if (re_getValue != exp_str_g) {
            println("re_getValue" + re_getValue)
            return 1
        }
        if (re_toString != exp_str_ts) {
            println("re_getValue" + re_getValue)
            return 2
        }
        if (re_toJsonString != exp_str_tj) {
            println("re_getValue" + re_getValue)
            return 3
        }
        return 0
    }
}

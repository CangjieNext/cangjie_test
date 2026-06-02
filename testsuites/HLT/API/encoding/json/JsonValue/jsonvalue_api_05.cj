/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args

import stdx.encoding.json.*

main(): Int64 {
    var jsonstr = """
{
  "name":true,
  "age":false
}"""
    var jsonvalue = JsonValue.fromStr(jsonstr)
    var str1 = jsonvalue.toString()
    var str2 = jsonvalue.toJsonString()
    if (str1 != "{\"name\":true,\"age\":false}") {
        println("str1=" + str1)
        return 1
    }
    var exp_jsonstr = """
{
  "name": true,
  "age": false
}"""
    if (str2 != exp_jsonstr) {
        println("str2=" + str2)
        return 2
    }
    return 0
}

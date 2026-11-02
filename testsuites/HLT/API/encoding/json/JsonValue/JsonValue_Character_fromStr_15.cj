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
<<<<<<< HEAD
    var jsonstrBefore = "{\"name\":\"app\nle\"}"
    try {
        JsonValue.fromStr(jsonstrBefore)
    } catch (_: JsonException) {
        return 0
||||||| constructed merge base
    var jsonstrBefore = "{\"name\":\"app\nle\"}"
    var jv = JsonValue.fromStr(jsonstrBefore)
    var jsonstrExpect = #"{
  "name": "app\nle"
}"#
    var jsonstrAfter = jv.toJsonString()
    println(jsonstrAfter)
    if (jsonstrExpect != jsonstrAfter) {
        println(1)
        return 1
=======
    var jsonstrBefore = "{\"name\":\"app\\nle\"}"
    var jv = JsonValue.fromStr(jsonstrBefore)
    var jsonstrExpect = #"{
  "name": "app\nle"
}"#
    var jsonstrAfter = jv.toJsonString()
    println(jsonstrAfter)
    if (jsonstrExpect != jsonstrAfter) {
        println(1)
        return 1
>>>>>>> feat: local mode
    }
    return 1
}

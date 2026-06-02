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
    var jsonStr = """
{
  "isFloat1": 0.1,
  "isFloat2": 0.111,
  "isFloat3": 0.111111,
  "isFloat4": 0.1111111
}"""
    var expValue: Array<Float64> = [0.100000, 0.111000, 0.111111, 0.1111111]
    var jsonvalue = JsonValue.fromStr(jsonStr)
    var actValue1 = jsonvalue.asObject().get("isFloat1").getOrThrow().asFloat().getValue()
    var actValue2 = jsonvalue.asObject().get("isFloat2").getOrThrow().asFloat().getValue()
    var actValue3 = jsonvalue.asObject().get("isFloat3").getOrThrow().asFloat().getValue()
    var actValue4 = jsonvalue.asObject().get("isFloat4").getOrThrow().asFloat().getValue()
    if (actValue1 != expValue[0] || actValue2 != expValue[1] || actValue3 != expValue[2] || actValue4 != expValue[3]) {
        println("${actValue1},${actValue2},${actValue3},${actValue4}")
        return 1
    }
    return 0
}

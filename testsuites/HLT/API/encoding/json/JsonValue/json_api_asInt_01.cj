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
  "isInt1": 0,
  "isInt2": -0,
  "isInt3": -9223372036854775808,
  "isInt4": 9223372036854775807
}"""
    var expValue = [0, -0, -9223372036854775808, 9223372036854775807]
    var jsonvalue = JsonValue.fromStr(jsonStr)
    var actValue1 = jsonvalue.asObject().get("isInt1").getOrThrow().asInt().getValue()
    var actValue2 = jsonvalue.asObject().get("isInt2").getOrThrow().asInt().getValue()
    var actValue3 = jsonvalue.asObject().get("isInt3").getOrThrow().asInt().getValue()
    var actValue4 = jsonvalue.asObject().get("isInt4").getOrThrow().asInt().getValue()
    if (actValue1 != expValue[0] || actValue2 != expValue[1] || actValue3 != expValue[2] || actValue4 != expValue[3]) {
        println("${actValue1},${actValue2},${actValue3},${actValue4}")
        return 1
    }
    return 0
}

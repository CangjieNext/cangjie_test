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
  "isInt": 1,
  "isString": "String",
  "isNull": null,
  "isObject": {"name":45},
  "isArray": [43,45],
  "isBool": true
}"""
    var jsonvalue = JsonValue.fromStr(jsonStr)
    var actKeys = ["isInt", "isString", "isNull", "isObject", "isArray", "isBool"]
    var count = 0
    for (i in actKeys) {
        try {
            var actValue1 = jsonvalue.asObject().get(i).getOrThrow().asFloat().getValue()
        } catch (e: JsonException) {
            if (e.toString().contains("Fail to convert to JsonFloat")) {
                count = count + 1
            }
        }
    }
    if (count != actKeys.size - 1) {
        return 1
    }
    return 0
}

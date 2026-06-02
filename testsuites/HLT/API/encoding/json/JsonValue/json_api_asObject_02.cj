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
  "isArray": [1,2],
  "isString": "String",
  "isInt": 45,
  "isNull": null,
  "isBool": true,
  "isFloat": 0.22
}"""
    var jsonValue = JsonValue.fromStr(jsonStr)
    var actKeys = ["isArray", "isString", "isInt", "isNull", "isBool", "isFloat"]
    var count = 0
    for (i in actKeys) {
        try {
            var actValue = jsonValue.asObject().get(i).getOrThrow().asObject()
        } catch (e: JsonException) {
            if (e.toString().contains("Fail to convert to JsonObject")) {
                count = count + 1
            }
        }
    }
    if (count != actKeys.size) {
        return 1
    }
    return 0
}

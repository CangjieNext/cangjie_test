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
  "name": "jerry"
}"""
    // var expValue="{\"name2\":[\"jerry\",\"tom\",\"amy\"]}"
    var expValue = "jerry"
    var jsonValue = JsonValue.fromStr(jsonStr)
    var actValue = jsonValue.asObject().get("name").getOrThrow().asString().getValue()
    if (actValue != expValue) {
        println(actValue)
        return 1
    }
    return 0
}

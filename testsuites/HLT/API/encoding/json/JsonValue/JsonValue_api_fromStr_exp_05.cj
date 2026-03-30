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
    var jsonstrBefore = "asddff"
    try {
        var jv = JsonValue.fromStr(jsonstrBefore)
    } catch (e: Exception) {
        if (e.toString().contains("Parse Error: [Line]: 1, [Pos]: 1, [Error]: Unexpected character: 'a'.")
            && e.toString().contains("JsonException: the json data is Non-standard")) {
            return 0
        }
    }
    return 1
}

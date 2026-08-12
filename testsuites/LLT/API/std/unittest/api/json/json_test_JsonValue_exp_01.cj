/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler    %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package std.unittest.test

import std.unittest.common.*

main(): Int64 {
    var jsonstrBefore = "{\"name\":\"￥\\%\"}"
    try {
        var jv = JsonValue.fromStr(jsonstrBefore)
    } catch (e: Exception) {
        if (e.toString().contains("JsonException: The json data is Non-standard")
            && e.toString().contains("Parse Error: [Line]: 1, [Pos]: 12, [Error]: Unexpected character: '%'.")) {
            return 0
        }
        return 2
    }
    return 1
}

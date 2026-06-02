/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan true

import stdx.encoding.json.*

func deserialize_string(str: String): String {
    return JsonValue.fromStr(str).asString().getValue()
}

func serialize_string(obj: String): String {
    return JsonString(obj).toString()
}

main() {
    var s1 = deserialize_string("\"\\\"\"") // should print "
    var s2 = deserialize_string("\"\\\\\"") // should print \
    var s3 = deserialize_string("\"he\\\"'l\\\"o\"") // should print he"'l"o
    var s4 = deserialize_string("\"\\n\"") // should print a newline
    var s5 = deserialize_string("\"\\t\"") // should print a tab

    var s8 = serialize_string("a\nb\fc\td\be\r/6f\\g") // should print "a\nb\fc\td\be\r/6f\\g"
    var s9 = serialize_string("\\\t\\") // should print "\\\t\\"
    var result = true
    if (s1 != "\"" && s2 != "\\" && s3 != "he\"'l\"o" && s4 != "\n" && s5 != "\t") {
        result = false
    }
    if (s8 != "\"a\\nb\\fc\\td\\be\\r/6f\\\\g\"" && s9 != "\"\\\\\\t\\\\\"") {
        result = false
    }
    print(result)
    return 0
}

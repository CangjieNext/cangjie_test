/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass01 pass02 pass03 pass04 pass05 pass06 pass07 pass08 pass09
import stdx.encoding.json.*

func deserialize_string(str: String): String {
    return JsonValue.fromStr(str).asString().getValue()
}

func serialize_string(obj: String): String {
    return JsonString(obj).toString()
}

main() {
    if (deserialize_string("\"\\\"\"") == "\"") {
        print("pass01 ")
    } else {
        print("fail01 ")
    }
    if (deserialize_string("\"\\\\\"") == "\\") {
        print("pass02 ")
    } else {
        print("fail02 ")
    }
    if (deserialize_string("\"he\\\"'l\\\"o\"") == "he\"'l\"o") {
        print("pass03 ")
    } else {
        print("fail03 ")
    }
    if (deserialize_string("\"\\nsss\"") == "\nsss") {
        print("pass04 ")
    } else {
        print("fail04 ")
    }
    if (deserialize_string("\"\\tddd\"") == "\tddd") {
        print("pass05 ")
    } else {
        print("fail05 ")
    }
    if (deserialize_string("\"\'\"") == "'") {
        print("pass06 ")
    } else {
        print("fail06 ")
    }
    if (serialize_string("Hello\n\tWorld") == "\"Hello\\n\\tWorld\"") {
        print("pass07 ")
    } else {
        print("fail07 ")
    }
    if (serialize_string("a\nb\fc\td\be\r/6f\\g") == "\"a\\nb\\fc\\td\\be\\r/6f\\\\g\"") {
        print("pass08 ")
    } else {
        print("fail08 ")
    }
    if (serialize_string("\\\t\\") == "\"\\\\\\t\\\\\"") {
        print("pass09 ")
    } else {
        print("fail09 ")
    }
}

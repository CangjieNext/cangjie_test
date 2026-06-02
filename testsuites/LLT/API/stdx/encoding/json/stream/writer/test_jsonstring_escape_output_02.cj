/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC:%set_stdx_path %run %run_opt %output %run_utest_opt

import stdx.encoding.json.*

@Test
class Test_jsonstring_escape_output_02 {
    @TestCase
    func test_control_and_symbol_escaping(): Unit {
        let value = JsonString("quote\"slash\\line\nrow\rtab\tdelete\u{7f}")
        @Expect(
            value.toJsonString(),
            "\"quote\\\"slash\\\\line\\nrow\\rtab\\tdelete\\u007f\""
        )
    }

    @TestCase
    func test_html_safe_array_and_unescaped_variant(): Unit {
        let arr = JsonArray()
        arr.add(JsonString("&"))
        @Expect(arr.toJsonString(), "[\n  \"\\u0026\"\n]")
        @Expect(arr.toJsonStringWithoutEscaping(), "[\n  \"&\"\n]")
    }

    @TestCase
    func test_long_control_string_uses_expanded_escape_buffer(): Unit {
        let value = JsonString("\n" * 2048)
        let encoded = value.toJsonString()
        @Expect(encoded.size, 4098)
        @Expect(encoded.startsWith("\"\\n\\n"))
        @Expect(encoded.endsWith("\\n\\n\""))
    }

    @TestCase
    func test_object_key_with_escape_heavy_name_still_serializes(): Unit {
        let obj = JsonObject()
        obj.put("quote\"slash\\amp&", JsonInt(1))
        let encoded = obj.toJsonString()
        @Expect(encoded.contains("\"quote\\\"slash\\\\amp\\u0026\": 1"))
    }
}

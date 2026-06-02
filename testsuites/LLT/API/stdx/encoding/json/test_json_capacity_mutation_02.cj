/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import stdx.encoding.json.*

@Test
class Test_json_capacity_mutation_02 {
    @TestCase
    func test_array_add_after_first_serialization(): Unit {
        let arr = JsonArray()
        arr.add(JsonInt(1))
        @Expect(arr.toString(), "[1]")
        arr.add(JsonString("tail"))
        @Expect(arr.toString(), "[1,\"tail\"]")
    }

    @TestCase
    func test_object_put_after_first_serialization(): Unit {
        let obj = JsonObject()
        obj.put("first", JsonInt(1))
        @Expect(obj.toString().contains("\"first\":1"))
        obj.put("second", JsonString("tail"))
        let encoded = obj.toString()
        @Expect(encoded.contains("\"first\":1"))
        @Expect(encoded.contains("\"second\":\"tail\""))
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.encoding.json.*
import std.io.*
import std.collection.*
import stdx.serialization.serialization.*
import stdx.encoding.json.stream.*

@Test
public class Test_json_06 {
    @TestCase
    func test_json_JsonReader(): Unit {
        @Expect(JsonToken.JsonNull ==JsonToken.JsonBool,false)
        @Expect(JsonToken.JsonNumber ==JsonToken.JsonString,false)
        @Expect(JsonToken.BeginArray ==JsonToken.EndArray,false)
        @Expect(JsonToken.BeginObject ==JsonToken.EndObject,false)
        JsonToken.Name.hashCode()
        @Expect(JsonToken.Name ==JsonToken.Name,true)
    }
}

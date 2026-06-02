/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import stdx.encoding.json.stream.*

@Test
public class JsonTokenTest {
    @TestCase
    func jsontokenEqual(): Unit {
        @Expect(JsonToken.JsonNull == JsonToken.JsonNull, true)
        @Expect(JsonToken.JsonBool == JsonToken.JsonBool, true)
        @Expect(JsonToken.JsonNumber == JsonToken.JsonNumber, true)
        @Expect(JsonToken.JsonString == JsonToken.JsonString, true)
        @Expect(JsonToken.BeginArray == JsonToken.BeginArray, true)
        @Expect(JsonToken.EndArray == JsonToken.EndArray, true)
        @Expect(JsonToken.BeginObject == JsonToken.BeginObject, true)
        @Expect(JsonToken.EndObject == JsonToken.EndObject, true)
        @Expect(JsonToken.Name == JsonToken.Name, true)
        @Expect(JsonToken.JsonNull == JsonToken.Name, false)
        @Expect(JsonToken.JsonBool == JsonToken.JsonNull, false)
        @Expect(JsonToken.JsonNumber == JsonToken.JsonNull, false)
        @Expect(JsonToken.JsonString == JsonToken.JsonNull, false)
        @Expect(JsonToken.BeginArray == JsonToken.JsonNull, false)
        @Expect(JsonToken.EndArray == JsonToken.JsonNull, false)
        @Expect(JsonToken.BeginObject == JsonToken.JsonNull, false)
        @Expect(JsonToken.EndObject == JsonToken.JsonNull, false)
        @Expect(JsonToken.Name == JsonToken.JsonNull, false)
    }

    @TestCase
    func jsontokenNotequal(): Unit {
        @Expect(JsonToken.JsonNull != JsonToken.JsonNull, false)
        @Expect(JsonToken.JsonBool != JsonToken.JsonBool, false)
        @Expect(JsonToken.JsonNumber != JsonToken.JsonNumber, false)
        @Expect(JsonToken.JsonString != JsonToken.JsonString, false)
        @Expect(JsonToken.BeginArray != JsonToken.BeginArray, false)
        @Expect(JsonToken.EndArray != JsonToken.EndArray, false)
        @Expect(JsonToken.BeginObject != JsonToken.BeginObject, false)
        @Expect(JsonToken.EndObject != JsonToken.EndObject, false)
        @Expect(JsonToken.Name != JsonToken.Name, false)
        @Expect(JsonToken.JsonNull != JsonToken.Name, true)
        @Expect(JsonToken.JsonBool != JsonToken.JsonNull, true)
        @Expect(JsonToken.JsonNumber != JsonToken.JsonNull, true)
        @Expect(JsonToken.JsonString != JsonToken.JsonNull, true)
        @Expect(JsonToken.BeginArray != JsonToken.JsonNull, true)
        @Expect(JsonToken.EndArray != JsonToken.JsonNull, true)
        @Expect(JsonToken.BeginObject != JsonToken.JsonNull, true)
        @Expect(JsonToken.EndObject != JsonToken.JsonNull, true)
        @Expect(JsonToken.Name != JsonToken.JsonNull, true)
    }

    @TestCase
    func jsontokenHashcode(): Unit {
        @Expect(JsonToken.JsonNull.hashCode(), 0)
        @Expect(JsonToken.JsonBool.hashCode(), 1)
        @Expect(JsonToken.JsonNumber.hashCode(), 2)
        @Expect(JsonToken.JsonString.hashCode(), 3)
        @Expect(JsonToken.BeginArray.hashCode(), 4)
        @Expect(JsonToken.EndArray.hashCode(), 5)
        @Expect(JsonToken.BeginObject.hashCode(), 6)
        @Expect(JsonToken.EndObject.hashCode(), 7)
        @Expect(JsonToken.Name.hashCode(), 8)
    }
}

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
public class Test_json_04 {
    @TestCase
    func test_json_JsonReader(): Unit {
        let jsonStr = "{\"key1\":{\"fieldTemp1\":-1,\"fieldTemp2\":5,\"fieldTemp3\":\"key1\"}}"
        var bas = ByteBuffer(jsonStr.toArray())
        var reader = JsonReader(bas)
        try {
            reader.startArray()
        } catch (e: IllegalStateException) {
            @Expect(e.toString(),"IllegalStateException: The next Token is not BeginArray.")
        }
        try {
            reader.endArray()
        } catch (e: Exception) {
            @Expect(e.toString(),"IllegalStateException: Failed to end array.")
        }
        reader.skip()

        try {
            reader.readName()
        } catch (e: Exception) {
            @Expect(e.toString(),"IllegalStateException: Failed to read name.")
        }
        @Expect(reader.peek().isNone(),true)
    }
}

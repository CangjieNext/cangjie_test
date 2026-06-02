/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import stdx.encoding.json.stream.*
import std.io.*

@Test
public class Test_WriteConfig_Combination {
    func WriteJson(cfg: WriteConfig): String {
        let buffer = ByteBuffer()
        let writer = JsonWriter(buffer)
        writer.writeConfig = cfg

        writer.startObject()
        writer.writeName("测试中文").writeValue("")
        writer.writeName("测试\t测试").writeValue("测试\t测试")
        writer.writeName("测试 测试").writeValue("测试 测试")
        writer.writeName("测试\n测试").writeValue("测试\n测试")
        writer.writeName("packageRequires").startObject()
        writer.endObject()
        writer.writeName("arr").writeValue(["this is arr[0]", "this is arr[1]", "this is arr[2]"])
        writer.writeName("arr2").writeValue(Array<String>())
        writer.endObject()

        writer.flush()
        return String.fromUtf8(buffer.bytes())
    }

    let jsonstr_1 = ###"{
    "测试中文": "",
    "测试\t测试": "测试\t测试",
    "测试 测试": "测试 测试",
    "测试\n测试": "测试\n测试",
    "packageRequires": {
    },
    "arr": [
        "this is arr[0]",
        "this is arr[1]",
        "this is arr[2]"
    ],
    "arr2": [
    ]
}"###

    let jsonstr_2 = ##"{"测试中文":"","测试\t测试":"测试\t测试","测试 测试":"测试 测试","测试\n测试":"测试\n测试","packageRequires":{},"arr":["this is arr[0]","this is arr[1]","this is arr[2]"],"arr2":[]}"##

    @TestCase
    func test_combination_01() {
        var cfg = WriteConfig.pretty
        @Expect(WriteJson(cfg), jsonstr_1)
    }

    @TestCase
    func test_combination_02() {
        var cfg = WriteConfig.compact
        @Expect(WriteJson(cfg), jsonstr_2)
    }
}

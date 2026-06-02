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
public class Test_WriteConfig_Settings {
    func WriteJson(cfg: WriteConfig): String {
        let buffer = ByteBuffer()
        let writer = JsonWriter(buffer)
        writer.writeConfig = cfg

        writer.startObject()
        writer.writeName("organization").writeValue("")
        writer.writeName("name").writeValue("b")
        writer.writeName("description").writeValue("nothing here")
        writer.writeName("version").writeValue("1.0.0")
        writer.writeName("requires")
        writer.startObject()
        writer.writeName("aaa")
        writer.startObject()
        writer.writeName("html").writeValue("<html>&lt;tag1&gt;a='b'&lt;/tag1&gt;body</html>")
        writer.writeName("path").writeValue("a")
        writer.endObject()
        writer.endObject()
        writer.writeName("packageRequires").startObject()
        writer.endObject()
        writer.writeName("arr").writeValue(["this is arr[0]", "this is arr[1]", "this is arr[2]"])
        writer.writeName("arr2").writeValue(Array<String>())
        writer.endObject()

        writer.flush()
        return String.fromUtf8(buffer.bytes())
    }

    let indent_2 = """
{
    "organization": "",
    "name": "b",
    "description": "nothing here",
    "version": "1.0.0",
    "requires": {
        "aaa": {
            "html": "<html>&lt;tag1&gt;a='b'&lt;/tag1&gt;body</html>",
            "path": "a"
        }
    },
    "packageRequires": {
    },
    "arr": [
        "this is arr[0]",
        "this is arr[1]",
        "this is arr[2]"
    ],
    "arr2": [
    ]
}"""

    let newline_1 = """
{
    "organization": "",
    "name": "b",
    "description": "nothing here",
    "version": "1.0.0",
    "requires": {
        "aaa": {
            "html": "<html>&lt;tag1&gt;a='b'&lt;/tag1&gt;body</html>",
            "path": "a"
        }
    },
    "packageRequires": {
    },
    "arr": [
        "this is arr[0]",
        "this is arr[1]",
        "this is arr[2]"
    ],
    "arr2": [
    ]
}"""

    let newline_2 = """
{


    "organization": "",


    "name": "b",


    "description": "nothing here",


    "version": "1.0.0",


    "requires": {


        "aaa": {


            "html": "<html>&lt;tag1&gt;a='b'&lt;/tag1&gt;body</html>",


            "path": "a"


        }


    },


    "packageRequires": {


    },


    "arr": [


        "this is arr[0]",


        "this is arr[1]",


        "this is arr[2]"


    ],


    "arr2": [


    ]


}"""

    @TestCase
    func test_indents() {
        var cfg = WriteConfig.pretty
        cfg.useSpaceAfterSeparators = true
        println(WriteJson(cfg))
        @Expect(WriteJson(cfg).contains("<html>&lt;tag1&gt;a='b'&lt;/tag1&gt;body</html>"),true)
        cfg.htmlSafe = true
        @Expect(WriteJson(cfg).contains("this is arr[0]"),true)
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC:%set_stdx_path %run %run_opt %output %run_utest_opt

import stdx.encoding.json.stream.{JsonWriter, WriteConfig}
import std.io.ByteBuffer
import std.random.Random
import std.time.DateTime

@Test
class TestWriteConfig {
    let compact = "{\"organization\":\"\",\"name\":\"b\",\"description\":\"nothing here\",\"version\":\"1.0.0\",\"requires\":{\"aaa\":{\"html\":\"<html>&lt;tag1&gt;a='b'&lt;/tag1&gt;body</html>\",\"path\":\"a\"}},\"packageRequires\":{},\"arr\":[\"this is arr[0]\",\"this is arr[1]\",\"this is arr[2]\"],\"arr2\":[]}"
    let compact_useSpace = "{\"organization\": \"\",\"name\": \"b\",\"description\": \"nothing here\",\"version\": \"1.0.0\",\"requires\": {\"aaa\": {\"html\": \"<html>&lt;tag1&gt;a='b'&lt;/tag1&gt;body</html>\",\"path\": \"a\"}},\"packageRequires\": {},\"arr\": [\"this is arr[0]\", \"this is arr[1]\", \"this is arr[2]\"],\"arr2\": []}"

    let pretty = """
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

    let pretty_newline2 = """
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

    let pretty_indent2 = """
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
    func testCompact(): Unit {
        let json = writeJson(None)
        @Expect(json == compact)
    }

    @TestCase
    func testPretty(): Unit {
        let json = writeJson(WriteConfig.pretty)
        @Expect(json == pretty)
    }

    @TestCase
    func testNewline(): Unit {
        var cfg = WriteConfig.pretty
        cfg.newline = "\n\n"
        let json = writeJson(cfg)
        @Expect(json == pretty_newline2)
    }

    @TestCase
    func testIndent(): Unit {
        var cfg = WriteConfig.pretty
        cfg.indent = "  "
        let json = writeJson(cfg)
        @Expect(json == pretty_indent2)
    }

    @TestCase
    func testUseSpaceAfterSeparators(): Unit {
        var cfg = WriteConfig.compact
        cfg.useSpaceAfterSeparators = true
        let json = writeJson(cfg)
        @Expect(json == compact_useSpace)
    }

    @TestCase
    func testHtmlSafe(): Unit {
        var cfg = WriteConfig.compact
        cfg.htmlSafe = true
        let json = writeJson(cfg)
        @Expect(json.contains("\\u003chtml\\u003e\\u0026lt;tag1\\u0026gt;a\\u003d\\u0027b\\u0027\\u0026lt;/tag1\\u0026gt;body\\u003c/html\\u003e"))
    }

    @TestCase
    func testNoNewlineWithIndent(): Unit {
        var cfg = WriteConfig.pretty
        cfg.indent = "  "
        cfg.newline = ""
        let json = writeJson(cfg)
        @Expect(json == compact_useSpace)
    }

    @TestCase
    func testInvalidNewLine(): Unit {
        let rand = Random(UInt64(DateTime.now().toUnixTimeStamp().toNanoseconds()))
        let newline = unsafe { String.fromUtf8Unchecked(
            Array<Byte>(
                2,
                {
                    _ =>
                    var v = rand.nextUInt8()
                    if (v == b'\r' || v == b'\n') {
                        v = b'a'
                    }
                    return v
                }
            )
        ) }
        var cfg = WriteConfig.compact
        try {
            cfg.newline = newline
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            // ok
        }
    }

    @TestCase
    func testInvalidIndent(): Unit {
        let rand = Random(UInt64(DateTime.now().toUnixTimeStamp().toNanoseconds()))
        let indent = unsafe { String.fromUtf8Unchecked(
            Array<Byte>(
                2,
                {
                    _ =>
                    var v = rand.nextUInt8()
                    if (v == b' ' || v == b'\t') {
                        v = b'a'
                    }
                    return v
                }
            )
        ) }
        var cfg = WriteConfig.compact
        try {
            cfg.indent = indent
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            // ok
        }
    }

    func writeJson(wCfg: ?WriteConfig): String {
        let buffer = ByteBuffer()
        let writer = JsonWriter(buffer)

        if (let Some(cfg) <- wCfg) {
            writer.writeConfig = cfg
        }

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
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args
import stdx.encoding.json.stream.*
import std.math.numeric.*
import std.io.{ByteBuffer, readToEnd}

@Test
public class Test_json_03 {
    @TestCase
    func test_json_json_03(): Unit {
        let image = Image()
        image.width = 800
        image.height = 600
        image.title = "View from 15th Floor"
        image.ids = [116, 943, 234, 38793]

        let stream = ByteBuffer()
        let writer = JsonWriter(stream)
        writer.writeValue(image)
        writer.flush()
        @Expect(String.fromUtf8(readToEnd(stream)).size,83)
    }
}

class Image <: JsonSerializable {
    var width: Int64
    var height: Int64
    var title: String
    var ids: Array<Int64>

    public init() {
        width = 0
        height = 0
        title = ""
        ids = Array<Int64>()
    }

    public func toJson(w: JsonWriter): Unit {
        w.startObject() // start encoding an object
        w.writeName("Width").writeValue(width) // write name and value pair in current object
        w.writeName("Height").writeValue(height)
        w.writeName("Title").writeValue(title)
        w.writeName("Ids").writeValue<Array<Int64>>(ids) //use class Array's func toJson
        w.endObject() // end current object
    }
}

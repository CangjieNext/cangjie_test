/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC:%set_stdx_path %run %run_opt %output %run_utest_opt

import std.io.*
import stdx.encoding.json.stream.*
import std.collection.*

class writer <: ToString {
    var input = ByteBuffer()
    var jw = JsonWriter(input)

    public func toString(): String {
        jw.flush()
        return String.fromUtf8(readToEnd(input))
    }
}

class subClass <: JsonSerializable {
    let arr: Array<Int64>

    init(v: Int64) {
        arr = Array<Int64>(v, repeat: v)
    }

    public func toJson(w: JsonWriter): Unit {
        w.writeValue<Array<Int64>>(arr)
    }
}

class topClass <: JsonSerializable {
    let arr = ArrayList<myClass>()

    public func toJson(w: JsonWriter): Unit {
        w.writeValue<ArrayList<myClass>>(arr)
    }
}

class myClass <: JsonSerializable {
    var name: String
    var value: subClass

    init(name: String, value: Int64) {
        this.name = name
        this.value = subClass(value)
    }
    public func toJson(w: JsonWriter): Unit {
        w.startObject()
        w.writeName(name).writeValue(value)
        w.endObject()
        w.flush()
    }
}

@Test
class Test_Json_Stress {
    @TestCase
    func test_array_in_object(): Unit {
        let w = writer()
        let v = myClass("v1", 1)
        w.jw.writeValue(v)
        @Expect(w.toString(),"{\"v1\":[1]}")

        let w2 = writer()
        let v2 = myClass("v2", 2)
        w2.jw.writeValue(v2)
        @Expect(w2.toString(),"{\"v2\":[2,2]}")

        let w3 = writer()
        let v3 = myClass("v3", 3)
        w3.jw.writeValue(v3)
        @Expect(w3.toString(),"{\"v3\":[3,3,3]}")
    }

    @TestCase
    func test_object_in_array(): Unit {
        let w = writer()
        let v = topClass()
        v.arr.add(myClass("v1", 1))
        w.jw.writeValue(v)
        @Expect(w.toString(),"[{\"v1\":[1]}]")

        let w2 = writer()
        v.arr.add(myClass("v2", 2))
        w2.jw.writeValue(v)
        @Expect(w2.toString(),"[{\"v1\":[1]},{\"v2\":[2,2]}]")

        let w3 = writer()
        v.arr.add(myClass("v3", 3))
        w3.jw.writeValue(v)
        @Expect(w3.toString(),"[{\"v1\":[1]},{\"v2\":[2,2]},{\"v3\":[3,3,3]}]")
    }

    @TestCase
    func test_multi_array(): Unit {
        let w = writer()
        for (i in 0..99) {
            w.jw.startArray()
        }

        try {
            w.jw.startArray()
        } catch (_: IllegalStateException) {
            for (i in 0..99) {
                w.jw.endArray()
            }
            return
        }
        @Assert(false)
    }

    @TestCase
    func test_multi_Object(): Unit {
        let w = writer()
        for (i in 0..99) {
            w.jw.startObject()
            w.jw.writeName("")
        }
        w.jw.writeValue("")

        try {
            w.jw.startObject()
        } catch (_: IllegalStateException) {
            for (i in 0..99) {
                w.jw.endObject()
            }
            return
        }
        @Assert(false)
    }

    @TestCase
    func test_long_string(): Unit {
        let string255 = "H4sIAAAAAAAAA9Vdb3PTRhr/Kh4znYEZ25FWsmSZ6YtrSua46bWdpveq3GQUW4kFsuWzZCBlMpMCofyHOaBQCHAtpcH4sIAAAAAAAAA9Vdb3PTRhr/Kh4znYEZ25FWsmSZ6YtrSua46bWdpveq3GQUW4kFsuWzZCBlMpMCofyHOaBQCHAtpcH4sIAAAAAAAAA9Vdb3PTH4sIAAAAAAAAA9Vdb3PTRhr/Kh4znYEZ25FWasdfadfsAsrHG1324Ar"
        let string510 = string255 * 2
        let string4080 = string255 * 16
        let string5100 = string255 * 20

        try {
            let w = writer()
            w.jw.writeValue(string255)
            @Expect(w.toString(),"\"${string255}\"")
        } catch (_: IllegalStateException) {
            @Assert(false)
        }

        try {
            let w = writer()
            w.jw.writeValue(string510)
            @Expect(w.toString(),"\"${string510}\"")
        } catch (_: IllegalStateException) {
            @Assert(false)
        }

        try {
            let w = writer()
            w.jw.writeValue(string4080)
            @Expect(w.toString(),"\"${string4080}\"")
        } catch (_: IllegalStateException) {
            @Assert(false)
        }

        try {
            let w = writer()
            w.jw.writeValue(string5100)
            @Expect(w.toString(),"\"${string5100}\"")
        } catch (_: IllegalStateException) {
            @Assert(false)
        }

        try {
            let w = writer()
            w.jw.jsonValue(string255)
            @Expect(w.toString(),"${string255}")
        } catch (_: IllegalStateException) {
            @Assert(false)
        }

        try {
            let w = writer()
            w.jw.jsonValue(string510)
            @Expect(w.toString(),"${string510}")
        } catch (_: IllegalStateException) {
            @Assert(false)
        }

        try {
            let w = writer()
            w.jw.jsonValue(string4080)
            @Expect(w.toString(),"${string4080}")
        } catch (_: IllegalStateException) {
            @Assert(false)
        }

        try {
            let w = writer()
            w.jw.jsonValue(string5100)
            @Expect(w.toString(),"${string5100}")
        } catch (_: IllegalStateException) {
            @Assert(false)
        }
    }
}

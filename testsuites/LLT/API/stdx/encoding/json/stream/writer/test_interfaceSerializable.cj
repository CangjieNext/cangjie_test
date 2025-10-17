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
import std.collection.concurrent.ConcurrentHashMap
import std.math.*

class writer <: ToString {
    var input = ByteBuffer()
    var jw = JsonWriter(input)

    public func toString(): String {
        jw.flush()
        return String.fromUtf8(readToEnd(input))
    }
}

class myClass <: JsonSerializable {
    var name: String
    var value: Int64

    init(name: String, value: Int64) {
        this.name = name
        this.value = value
    }
    public func toJson(w: JsonWriter) {
        w.startObject()
        w.writeName(name).writeValue(value)
        w.endObject()
        w.flush()
    }
}

/**
 *  测试JsonSerializable 接口功能是否正确
 */
@Test
class Test_JsonSerializable {

    //正常场景,1个元素，2..个元素
    @TestCase
    func test_Int64_JsonSerializable(): Unit {
        let w = writer()
        w.jw.startArray()
        w.jw.writeValue(Int64.Max)
        w.jw.endArray()
        @Expect("[9223372036854775807]",w.toString())

        let w2 = writer()
        w2.jw.startArray()
        w2.jw.writeValue(Int64.Min)
        w2.jw.endArray()
        @Expect("[-9223372036854775808]",w2.toString())
    }

    @TestCase
    func test_UInt64_JsonSerializable(): Unit {
        let w = writer()
        w.jw.startArray()
        w.jw.writeValue(UInt64(123))
        w.jw.endArray()
        @Expect("[123]",w.toString())

        let w2 = writer()
        w2.jw.startArray()
        w2.jw.writeValue(UInt64.Max)
        w2.jw.endArray()
        @Expect("[18446744073709551615]",w2.toString())
    }

    @TestCase
    func test_Float64_JsonSerializable(): Unit {
        let w = writer()
        w.jw.startArray()
        w.jw.writeValue(123.12)
        w.jw.endArray()
        @Expect("[123.12]",w.toString())

        let w2 = writer()
        w2.jw.startArray()
        w2.jw.writeValue(-123.0)
        w2.jw.endArray()
        @Expect("[-123]",w2.toString())

        let w3 = writer()
        w3.jw.startArray()
        w3.jw.writeValue(1234567891011121.0)
        w3.jw.endArray()
        @Expect("[1234567891011121]",w3.toString())
    }

    @TestCase
    func test_Bool_JsonSerializable(): Unit {
        let w = writer()
        w.jw.startArray()
        w.jw.writeValue(true)
        w.jw.endArray()
        @Expect("[true]",w.toString())

        let w2 = writer()
        w2.jw.startArray()
        w2.jw.writeValue(false)
        w2.jw.endArray()
        @Expect("[false]",w2.toString())
    }

    @TestCase
    func test_Null_JsonSerializable(): Unit {
        let w = writer()
        w.jw.startArray()
        w.jw.writeNullValue()
        w.jw.endArray()
        @Expect("[null]",w.toString())
    }

    @TestCase
    func test_Option_JsonSerializable(): Unit {
        let w = writer()
        w.jw.startArray()
        w.jw.writeValue<Option<Int64>>(Some(1))
        w.jw.endArray()
        @Expect("[1]",w.toString())

        let w2 = writer()
        w2.jw.startArray()
        w2.jw.writeValue<Option<Int64>>(Option<Int64>.None)
        w2.jw.endArray()
        @Expect("[null]",w2.toString())
    }

    @TestCase
    func test_Array_JsonSerializable(): Unit {
        let w = writer()
        let arr = [1, 2, 3]
        w.jw.startArray()
        w.jw.writeValue<Array<Int64>>(arr)
        w.jw.endArray()
        @Expect("[[1,2,3]]",w.toString())

        let w2 = writer()
        w2.jw.writeValue<Array<Int64>>(arr)
        @Expect("[1,2,3]",w2.toString())
        try {
            w2.jw.startArray()
            @Assert(false)
        } catch (_: IllegalStateException) {
        }

        let w3 = writer()
        w3.jw.startObject()
        w3.jw.writeName("te")
        w3.jw.writeValue<Array<Int64>>(arr)
        w3.jw.endObject()
        @Expect("{\"te\":[1,2,3]}",w3.toString())
    }

    @TestCase
    func test_ArrayList_JsonSerializable(): Unit {
        let w = writer()
        let arr = ArrayList<Int64>([1, 2, 3])
        w.jw.startArray()
        w.jw.writeValue<ArrayList<Int64>>(arr)
        w.jw.endArray()
        @Expect("[[1,2,3]]",w.toString())

        let w2 = writer()
        w2.jw.writeValue<ArrayList<Int64>>(arr)
        @Expect("[1,2,3]",w2.toString())
        try {
            w2.jw.startArray()
            @Assert(false)
        } catch (_: IllegalStateException) {
        }

        let w3 = writer()
        w3.jw.startObject()
        w3.jw.writeName("te")
        w3.jw.writeValue<ArrayList<Int64>>(arr)
        w3.jw.endObject()
        @Expect("{\"te\":[1,2,3]}",w3.toString())
    }

    @TestCase
    func test_Interface_JsonSerializable(): Unit {
        let m1 = myClass("1", 1)
        let m2 = myClass("2", 2)
        let m3 = myClass("3", 3)
        let w = writer()
        w.jw.writeValue<myClass>(m1)
        @Expect("{\"1\":1}", w.toString())

        let arr: Array<myClass> = [m1, m2, m3]
        let w2 = writer()
        w2.jw.writeValue<Array<myClass>>(arr)
        @Expect("[{\"1\":1},{\"2\":2},{\"3\":3}]", w2.toString())
    }

    @TestCase
    func test_HashMap_JsonSerializable(): Unit {
        let map = HashMap<String, Int64>()
        map.add("1", 1)
        map.add("2", 2)
        map.add("3", 3)
        let w = writer()
        w.jw.writeValue<HashMap<String, Int64>>(map)
        @Expect("{\"1\":1,\"2\":2,\"3\":3}", w.toString())

        let m1 = myClass("1", 1)
        let m2 = myClass("2", 2)
        let m3 = myClass("3", 3)
        let map2 = HashMap<String, myClass>()
        map2.add("1", m1)
        map2.add("2", m2)
        map2.add("3", m3)
        let w2 = writer()
        w2.jw.writeValue<HashMap<String, myClass>>(map2)
        @Expect("{\"1\":{\"1\":1},\"2\":{\"2\":2},\"3\":{\"3\":3}}", w2.toString())

        let w3 = writer()
        w3.jw.startObject()
        w3.jw.writeName("a").writeValue<HashMap<String, Int64>>(map)
        w3.jw.endObject()
        @Expect("{\"a\":{\"1\":1,\"2\":2,\"3\":3}}", w3.toString())

        let w4 = writer()
        let map4: HashMap<String, HashMap<String, Int64>> = HashMap<String, HashMap<String, Int64>>()
        map4.add("b", map)
        w4.jw.startObject()
        w4.jw.writeName("a").writeValue<HashMap<String, HashMap<String, Int64>>>(map4)
        w4.jw.endObject()
        @Expect("{\"a\":{\"b\":{\"1\":1,\"2\":2,\"3\":3}}}", w4.toString())
    }

    @TestCase
    func test_HashSet_JsonSerializable(): Unit {
        let w = writer()
        let arr: HashSet<Int64> = HashSet<Int64>([1, 2, 3])
        w.jw.startArray()
        w.jw.writeValue<HashSet<Int64>>(arr)
        w.jw.endArray()
        @Expect("[[1,2,3]]",w.toString())

        let w2 = writer()
        w2.jw.writeValue<HashSet<Int64>>(arr)
        @Expect("[1,2,3]",w2.toString())
        try {
            w2.jw.startArray()
            @Assert(false)
        } catch (_: IllegalStateException) {
        }

        let w3 = writer()
        w3.jw.startObject()
        w3.jw.writeName("te")
        w3.jw.writeValue<HashSet<Int64>>(arr)
        w3.jw.endObject()
        @Expect("{\"te\":[1,2,3]}",w3.toString())
    }

    @TestCase
    func test_LinkedList_JsonSerializable(): Unit {
        let w = writer()
        var col: Collection<(Int64)> = [1, 2, 3]
        var arr: LinkedList<Int64> = LinkedList<Int64>(col)
        w.jw.startArray()
        w.jw.writeValue<LinkedList<Int64>>(arr)
        w.jw.endArray()
        @Expect("[[1,2,3]]",w.toString())

        let w2 = writer()
        w2.jw.writeValue<LinkedList<Int64>>(arr)
        @Expect("[1,2,3]",w2.toString())
        try {
            w2.jw.startArray()
            @Assert(false)
        } catch (_: IllegalStateException) {
        }

        let w3 = writer()
        w3.jw.startObject()
        w3.jw.writeName("te")
        w3.jw.writeValue<LinkedList<Int64>>(arr)
        w3.jw.endObject()
        @Expect("{\"te\":[1,2,3]}",w3.toString())
    }

    @TestCase
    func test_ArrayQueue_JsonSerializable(): Unit {
        let w = writer()
        var arr = ArrayQueue<Int64>()
        arr.add(1)
        arr.add(2)
        arr.add(3)

        w.jw.startArray()
        w.jw.writeValue<ArrayQueue<Int64>>(arr)
        w.jw.endArray()
        @Expect("[[1,2,3]]",w.toString())

        let w2 = writer()
        w2.jw.writeValue<ArrayQueue<Int64>>(arr)
        @Expect("[1,2,3]",w2.toString())
        try {
            w2.jw.startArray()
            @Assert(false)
        } catch (_: IllegalStateException) {
        }

        let w3 = writer()
        w3.jw.startObject()
        w3.jw.writeName("te")
        w3.jw.writeValue<ArrayQueue<Int64>>(arr)
        w3.jw.endObject()
        @Expect("{\"te\":[1,2,3]}",w3.toString())
    }


    @TestCase
    func test_ArrayDeque_JsonSerializable(): Unit {
        let w = writer()
        var arr = ArrayDeque<Int64>()
        arr.addLast(1)
        arr.addLast(2)
        arr.addLast(3)

        w.jw.startArray()
        w.jw.writeValue<ArrayDeque<Int64>>(arr)
        w.jw.endArray()
        @Expect("[[1,2,3]]",w.toString())

        let w2 = writer()
        w2.jw.writeValue<ArrayDeque<Int64>>(arr)
        @Expect("[1,2,3]",w2.toString())
        try {
            w2.jw.startArray()
            @Assert(false)
        } catch (_: IllegalStateException) {
        }

        let w3 = writer()
        w3.jw.startObject()
        w3.jw.writeName("te")
        w3.jw.writeValue<ArrayDeque<Int64>>(arr)
        w3.jw.endObject()
        @Expect("{\"te\":[1,2,3]}",w3.toString())
    }

    @TestCase
    func test_ArrayStack_JsonSerializable(): Unit {
        let w = writer()
        var arr = ArrayStack<Int64>()
        arr.add(1)
        arr.add(2)
        arr.add(3)

        w.jw.startArray()
        w.jw.writeValue<ArrayStack<Int64>>(arr)
        w.jw.endArray()
        @Expect("[[1,2,3]]",w.toString())

        let w2 = writer()
        w2.jw.writeValue<ArrayStack<Int64>>(arr)
        @Expect("[1,2,3]",w2.toString())
        try {
            w2.jw.startArray()
            @Assert(false)
        } catch (_: IllegalStateException) {
        }

        let w3 = writer()
        w3.jw.startObject()
        w3.jw.writeName("te")
        w3.jw.writeValue<ArrayStack<Int64>>(arr)
        w3.jw.endObject()
        @Expect("{\"te\":[1,2,3]}",w3.toString())
    }


    @TestCase
    func test_TreeSet_JsonSerializable(): Unit {
        let w = writer()
        var arr: TreeSet<Int64> = TreeSet.of(1, 2, 3)
        w.jw.startArray()
        w.jw.writeValue<TreeSet<Int64>>(arr)
        w.jw.endArray()
        @Expect("[[1,2,3]]",w.toString())

        let w2 = writer()
        w2.jw.writeValue<TreeSet<Int64>>(arr)
        @Expect("[1,2,3]",w2.toString())
        try {
            w2.jw.startArray()
            @Assert(false)
        } catch (_: IllegalStateException) {
        }

        let w3 = writer()
        w3.jw.startObject()
        w3.jw.writeName("te")
        w3.jw.writeValue<TreeSet<Int64>>(arr)
        w3.jw.endObject()
        @Expect("{\"te\":[1,2,3]}",w3.toString())
    }


    @TestCase
    func test_TreeMap_JsonSerializable(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("1", 1)
        map.add("2", 2)
        map.add("3", 3)
        let w = writer()
        w.jw.writeValue<TreeMap<String, Int64>>(map)
        @Expect("{\"1\":1,\"2\":2,\"3\":3}", w.toString())

        let m1 = myClass("1", 1)
        let m2 = myClass("2", 2)
        let m3 = myClass("3", 3)
        let map2 = TreeMap<String, myClass>()
        map2.add("1", m1)
        map2.add("2", m2)
        map2.add("3", m3)
        let w2 = writer()
        w2.jw.writeValue<TreeMap<String, myClass>>(map2)
        @Expect("{\"1\":{\"1\":1},\"2\":{\"2\":2},\"3\":{\"3\":3}}", w2.toString())

        let w3 = writer()
        w3.jw.startObject()
        w3.jw.writeName("a").writeValue<TreeMap<String, Int64>>(map)
        w3.jw.endObject()
        @Expect("{\"a\":{\"1\":1,\"2\":2,\"3\":3}}", w3.toString())

        let w4 = writer()
        let map4: TreeMap<String, TreeMap<String, Int64>> = TreeMap<String, TreeMap<String, Int64>>()
        map4.add("b", map)
        w4.jw.startObject()
        w4.jw.writeName("a").writeValue<TreeMap<String, TreeMap<String, Int64>>>(map4)
        w4.jw.endObject()
        @Expect("{\"a\":{\"b\":{\"1\":1,\"2\":2,\"3\":3}}}", w4.toString())
    }

    @TestCase
    func test_ConcurrentHashMap_JsonSerializable(): Unit {
        let map = ConcurrentHashMap<String, Int64>()
        map.add("1", 1)
        map.add("2", 2)
        map.add("3", 3)
        let w = writer()
        w.jw.writeValue<ConcurrentHashMap<String, Int64>>(map)

        @Expect("{\"3\":3,\"1\":1,\"2\":2}", w.toString())

        let m1 = myClass("1", 1)
        let m2 = myClass("2", 2)
        let m3 = myClass("3", 3)
        let map2 = ConcurrentHashMap<String, myClass>()
        map2.add("1", m1)
        map2.add("2", m2)
        map2.add("3", m3)
        let w2 = writer()
        w2.jw.writeValue<ConcurrentHashMap<String, myClass>>(map2)
        @Expect("{\"3\":{\"3\":3},\"1\":{\"1\":1},\"2\":{\"2\":2}}", w2.toString())

        let w3 = writer()
        w3.jw.startObject()
        w3.jw.writeName("a").writeValue<ConcurrentHashMap<String, Int64>>(map)
        w3.jw.endObject()
        @Expect("{\"a\":{\"3\":3,\"1\":1,\"2\":2}}", w3.toString())

        let w4 = writer()
        let map4: ConcurrentHashMap<String, ConcurrentHashMap<String, Int64>> = ConcurrentHashMap<String, ConcurrentHashMap<String, Int64>>()
        map4.add("b", map)
        w4.jw.startObject()
        w4.jw.writeName("a").writeValue<ConcurrentHashMap<String, ConcurrentHashMap<String, Int64>>>(map4)
        w4.jw.endObject()
        @Expect("{\"a\":{\"b\":{\"3\":3,\"1\":1,\"2\":2}}}", w4.toString())
    }
}

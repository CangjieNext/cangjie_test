/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.collection.*
import std.io.*
import stdx.encoding.json.stream.*

@Test
class Test_Json_Collection {
    @TestCase
    func test_LinkedList_01() {
        let obj = LinkedList<Int64>([1, 2, 100])
        let stream = ByteBuffer()
        let jw = JsonWriter(stream)
        obj.toJson(jw)
        jw.flush()
        @Assert(String.fromUtf8(readToEnd(stream)), "[1,2,100]")
        
        stream.seek(Begin(0))
        let js = JsonReader(stream)
        let _obj = LinkedList<Int64>.fromJson(js)
        @Assert(_obj.toString(), "[1, 2, 100]")
    }

    @TestCase
    func test_ArrayQueue_01() {
        let obj = ArrayQueue<Int64>()
        obj.add(1)
        obj.add(2)
        obj.add(100)
        let stream = ByteBuffer()
        let jw = JsonWriter(stream)
        obj.toJson(jw)
        jw.flush()
        @Assert(String.fromUtf8(readToEnd(stream)), "[1,2,100]")
        
        stream.seek(Begin(0))
        let js = JsonReader(stream)
        let _obj = ArrayQueue<Int64>.fromJson(js)
        @Assert(_obj.toString(), "[1, 2, 100]")
    }

    @TestCase
    func test_ArrayDeque_01() {
        let obj = ArrayDeque<Int64>()
        obj.addLast(1)
        obj.addLast(2)
        obj.addLast(100)
        let stream = ByteBuffer()
        let jw = JsonWriter(stream)
        obj.toJson(jw)
        jw.flush()
        @Assert(String.fromUtf8(readToEnd(stream)), "[1,2,100]")
        
        stream.seek(Begin(0))
        let js = JsonReader(stream)
        let _obj = ArrayDeque<Int64>.fromJson(js)
        @Assert(_obj.toString(), "[1, 2, 100]")
    }

    @TestCase
    func test_ArrayStack_01() {
        let obj = ArrayStack<Int64>()
        obj.add(1)
        obj.add(2)
        obj.add(100)
        @Assert(obj.toString(), "[100, 2, 1]")
        let stream = ByteBuffer()
        let jw = JsonWriter(stream)
        obj.toJson(jw)
        jw.flush()
        @Assert(String.fromUtf8(readToEnd(stream)), "[1,2,100]")
        
        stream.seek(Begin(0))
        let js = JsonReader(stream)
        let _obj = ArrayStack<Int64>.fromJson(js)
        @Assert(_obj.toString(), "[100, 2, 1]")
    }

    @TestCase
    func test_HashSet_01() {
        let obj = HashSet<Int64>([1, 2, 100])
        let stream = ByteBuffer()
        let jw = JsonWriter(stream)
        obj.toJson(jw)
        jw.flush()
        @Assert(String.fromUtf8(readToEnd(stream)), "[1,2,100]")
        
        stream.seek(Begin(0))
        let js = JsonReader(stream)
        let _obj = HashSet<Int64>.fromJson(js)
        @Assert(_obj.toString(), "[1, 2, 100]")
    }

    @TestCase
    func test_TreeSet_01() {
        let obj = TreeSet<Int64>([1, 2, 100])
        let stream = ByteBuffer()
        let jw = JsonWriter(stream)
        obj.toJson(jw)
        jw.flush()
        @Assert(String.fromUtf8(readToEnd(stream)), "[1,2,100]")
        
        stream.seek(Begin(0))
        let js = JsonReader(stream)
        let _obj = TreeSet<Int64>.fromJson(js)
        @Assert(_obj.toString(), "[1, 2, 100]")
    }

    @TestCase
    func test_TreeMap_01() {
        let obj = TreeMap<String, Int64>()
        obj.add("key1", 1)
        obj.add("key2", 2)
        let stream = ByteBuffer()
        let jw = JsonWriter(stream)
        obj.toJson(jw)
        jw.flush()
        @Assert(String.fromUtf8(readToEnd(stream)), "{\"key1\":1,\"key2\":2}")
        
        stream.seek(Begin(0))
        let js = JsonReader(stream)
        let _obj = TreeMap<String, Int64>.fromJson(js)
        @Assert(_obj.toString(), "[(key1, 1), (key2, 2)]")
    }
}

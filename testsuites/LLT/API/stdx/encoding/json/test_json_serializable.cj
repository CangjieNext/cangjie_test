/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt
 
 
import stdx.encoding.json.stream.*
import std.io.{ByteBuffer, readToEnd}
 
/**
 * Test description: Test the json serializable
 */
 
@Test
class JsonSerializableTest {
 
    @TestCase
    func test_Int32(): Unit {
        let a : Int32 = 2
        let stream = ByteBuffer()
        let writer = JsonWriter(stream)
        writer.writeValue(a)
        writer.flush()
        @Expect(String.fromUtf8(readToEnd(stream)), "2")
    }
 
    @TestCase
    func test_Int16(): Unit {
        let a : Int16 = 2
        let stream = ByteBuffer()
        let writer = JsonWriter(stream)
        writer.writeValue(a)
        writer.flush()
        @Expect(String.fromUtf8(readToEnd(stream)), "2")
    }
 
    @TestCase
    func test_Int8(): Unit {
        let a : Int8 = 2
        let stream = ByteBuffer()
        let writer = JsonWriter(stream)
        writer.writeValue(a)
        writer.flush()
        @Expect(String.fromUtf8(readToEnd(stream)), "2")
    }
 
    @TestCase
    func test_IntNative(): Unit {
        let a : IntNative = 2
        let stream = ByteBuffer()
        let writer = JsonWriter(stream)
        writer.writeValue(a)
        writer.flush()
        @Expect(String.fromUtf8(readToEnd(stream)), "2")
    }
 
    @TestCase
    func test_UInt32(): Unit {
        let a : UInt32 = 2
        let stream = ByteBuffer()
        let writer = JsonWriter(stream)
        writer.writeValue(a)
        writer.flush()
        @Expect(String.fromUtf8(readToEnd(stream)), "2")
    }
 
    @TestCase
    func test_UInt16(): Unit {
        let a : UInt16 = 2
        let stream = ByteBuffer()
        let writer = JsonWriter(stream)
        writer.writeValue(a)
        writer.flush()
        @Expect(String.fromUtf8(readToEnd(stream)), "2")
    }
 
    @TestCase
    func test_UInt8(): Unit {
        let a : UInt8 = 2
        let stream = ByteBuffer()
        let writer = JsonWriter(stream)
        writer.writeValue(a)
        writer.flush()
        @Expect(String.fromUtf8(readToEnd(stream)), "2")
    }
 
    @TestCase
    func test_UIntNative(): Unit {
        let a : UIntNative = 2
        let stream = ByteBuffer()
        let writer = JsonWriter(stream)
        writer.writeValue(a)
        writer.flush()
        @Expect(String.fromUtf8(readToEnd(stream)), "2")
    }
 
    @TestCase
    func test_Float32(): Unit {
        let a : Float32 = 2.0
        let stream = ByteBuffer()
        let writer = JsonWriter(stream)
        writer.writeValue(a)
        writer.flush()
        @Expect(String.fromUtf8(readToEnd(stream)), "2")
    }
 
    @TestCase
    func test_Float16(): Unit {
        let a : Float16 = 2.0
        let stream = ByteBuffer()
        let writer = JsonWriter(stream)
        writer.writeValue(a)
        writer.flush()
        @Expect(String.fromUtf8(readToEnd(stream)), "2")
    }
    
}
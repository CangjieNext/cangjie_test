// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import stdx.serialization.serialization.*
internal import std.collection.*

class MySerializeDemo1 {
    public func serialize1(): DataModel {
        var value: Int32 = 123
        return value.serialize()
    }
    public static func deserialize1(s: DataModel): MySerializeDemo1 {
        var d = Int64.deserialize(s)
        return MySerializeDemo1()
    }
}

extend MySerializeDemo1 <: Serializable<MySerializeDemo1> {
    public func serialize(): DataModel {
        var value: Int32 = 123
        return value.serialize()
    }
    public static func deserialize(s: DataModel): MySerializeDemo1 {
        var d = Int64.deserialize(s)
        return MySerializeDemo1()
    }
}

struct MySerializeDemo2 {
    public func serialize1(): DataModel {
        var value: Int32 = 123
        return value.serialize()
    }
    public static func deserialize1(s: DataModel): MySerializeDemo1 {
        var d = Int64.deserialize(s)
        return MySerializeDemo1()
    }
}

extend MySerializeDemo2 <: Serializable<MySerializeDemo2> {
    public func serialize(): DataModel {
        var value: Int64 = 123
        return DataModelStruct().add(Field("value", value.serialize()))
    }
    public static func deserialize(s: DataModel): MySerializeDemo2 {
        let d = (s as DataModelStruct).getOrThrow()
        var res = Int32.deserialize(d.get("value"))
        return MySerializeDemo2()
    }
}

class MySerializeDemo3 <: Serializable<MySerializeDemo3> {
    var value: Int64
    init(v: Int64) {
        value = v
    }
    public func serialize(): DataModel {
        return DataModelStruct().add(Field("value", value.serialize()))
    }
    public static func deserialize(s: DataModel): MySerializeDemo3 {
        let d = (s as DataModelStruct).getOrThrow()
        var res = Int8.deserialize(d.get("value"))
        return MySerializeDemo3(123)
    }
}

class MySerializeDemo4 <: Serializable<MySerializeDemo4> {
    var value: Int64
    init(v: Int64) {
        value = v
    }
    public func serialize(): DataModel {
        var v1 = value.serialize()
        return (Int32(value)).serialize()
    }
    public static func deserialize(s: DataModel): MySerializeDemo4 {
        let d1 = (s as DataModelStruct).getOrThrow()
        var res = Int32.deserialize(d1.get("value"))
        var d2 = Int16.deserialize(s)
        MySerializeDemo4(Int64(d2))
    }
}

class MySerializeDemo5 <: Serializable<MySerializeDemo5> {
    var value: Int64
    init(v: Int64) {
        value = v
    }
    public func serialize(): DataModel {
        if (value > 10) {
            return (Int32(value)).serialize()
        }
        if (value > 20) {
            return (Int16(value)).serialize()
        }
        if (value > 30) {
            var struct1 = DataModelStruct()
            struct1.add(field("value1", value))
            struct1.add(Field("value1", (Int32(value)).serialize()))
            struct1.add(Field("value1", (Float32(value)).serialize()))
            struct1.add(Field("value1", (Float64(value)).serialize()))
            var struct2 = DataModelStruct()
            struct2.add(Field("value3", value.serialize()))
            return struct1
        }
        var struct3 = DataModelStruct()
        struct3.add(Field("value4", value.serialize()))
        return struct3
    }
    public static func deserialize(s: DataModel): MySerializeDemo5 {
        let d1 = (s as DataModelStruct).getOrThrow()
        var res1 = Int32.deserialize(d1.get("value3"))
        var res2 = Float32.deserialize(d1.get("value"))
        var res3 = Int8.deserialize(d1.get("value1"))
        var d2 = Int8.deserialize(s)
        MySerializeDemo5(Int64(d2))
    }
}

class MySerializeDemo6 <: Serializable<MySerializeDemo6> {
    var value: Int64
    init(v: Int64) {
        value = v
    }
    public func serialize(): DataModel {
        var v = MySerializeDemo4(123).serialize()
        return MySerializeDemo5(123).serialize()
    }
    public static func deserialize(s: DataModel): MySerializeDemo6 {
        var v1 = MySerializeDemo4.deserialize(s)
        var v2 = MySerializeDemo5.deserialize(s)
        MySerializeDemo6(123)
    }
}

main() {}
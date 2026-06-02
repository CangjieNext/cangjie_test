// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import stdx.serialization.serialization.*
internal import std.math.*
internal import std.json.*

class A <: Serializable<A> {

    public var fieldTemp1 : Int8
    public var fieldTemp2 : UInt8
    public var fieldTemp3 : Int16
    public var fieldTemp4 : UInt16
    public var fieldTemp5 : Int32
    public var fieldTemp6 : UInt32
    public var fieldTemp7 : Int64
    public var fieldTemp8 : UInt64
    public var fieldTemp9 : B

    public init(fieldTemp1 : Int8, fieldTemp2 : UInt8, fieldTemp3 : Int16, fieldTemp4 : UInt16, fieldTemp5 : Int32,
        fieldTemp6 : UInt32, fieldTemp7 : Int64, fieldTemp8 : UInt64, fieldB1 : Float16, fieldB2 : Float32,
        fieldB3 : Float64, FieldB4 : Rune, fieldB5 : Bool, FieldB6 : String) {
        this.fieldTemp8 = fieldTemp8
        this.fieldTemp2 = fieldTemp2
        this.fieldTemp1 = fieldTemp1
        this.fieldTemp3 = fieldTemp3
        this.fieldTemp6 = fieldTemp6
        this.fieldTemp5 = fieldTemp5
        this.fieldTemp4 = fieldTemp4
        this.fieldTemp7 = fieldTemp7
        this.fieldTemp9 = B(fieldB1, fieldB2, fieldB3, FieldB4, fieldB5, FieldB6)
        println("this.fieldTemp1 is ${this.fieldTemp1}")
        println("this.fieldTemp2 is ${this.fieldTemp2}")
        println("this.fieldTemp3 is ${this.fieldTemp3}")
        println("this.fieldTemp4 is ${this.fieldTemp4}")
    }

    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("fieldTemp1", fieldTemp1.serialize()))
        dms.add(Field("fieldTemp2", fieldTemp2.serialize()))
        dms.add(Field("fieldTemp3", fieldTemp3.serialize()))
        dms.add(Field("fieldTemp4", fieldTemp4.serialize()))
        dms.add(Field("fieldTemp5", fieldTemp5.serialize()))
        dms.add(Field("fieldTemp6", fieldTemp6.serialize()))
        dms.add(Field("fieldTemp7", fieldTemp7.serialize()))
        dms.add(Field("fieldTemp8", fieldTemp8.serialize()))
        dms.add(Field("fieldTemp9", fieldTemp9.serialize()))
        return dms
    }

    public static func deserialize(dm: DataModel): A {
        let dms = (dm as DataModelStruct).getOrThrow()
        A(dms)
    }

    private init(dms : DataModelStruct) {
          this.fieldTemp1 = Int8.deserialize(dms.get("fieldTemp1"))
          this.fieldTemp2 = UInt8.deserialize(dms.get("fieldTemp2"))
          this.fieldTemp3 = Int16.deserialize(dms.get("fieldTemp3"))
          this.fieldTemp4 = UInt16.deserialize(dms.get("fieldTemp4"))
          this.fieldTemp5 = Int32.deserialize(dms.get("fieldTemp5"))
          this.fieldTemp6 = UInt32.deserialize(dms.get("fieldTemp6"))
          this.fieldTemp7 = Int64.deserialize(dms.get("fieldTemp7"))
          this.fieldTemp8 = UInt64.deserialize(dms.get("fieldTemp8"))
          this.fieldTemp9 = B.deserialize(dms.get("fieldTemp9"))
    }
    public operator func ==(rhs : A) : Bool {
        var result = true
        if (!(this.fieldTemp1 == rhs.fieldTemp1)) {
            println("fieldTemp1 is not equal, the origin is ${this.fieldTemp1}, the value convert from string is ${rhs.fieldTemp1} \n")
            result = false
        }
        if (!(this.fieldTemp2 == rhs.fieldTemp2)) {
            println("fieldTemp2 is not equal, the origin is ${this.fieldTemp2}, the value convert from string is ${rhs.fieldTemp2} \n")
            result = false
        }
        if (!(this.fieldTemp3 == rhs.fieldTemp3)) {
            println("fieldTemp3 is not equal, the origin is ${this.fieldTemp3}, the value convert from string is ${rhs.fieldTemp3} \n")
            result = false
        }
        if (!(this.fieldTemp4 == rhs.fieldTemp4)) {
            println("fieldTemp4 is not equal, the origin is ${this.fieldTemp4}, the value convert from string is ${rhs.fieldTemp4} \n")
            result = false
        }
        if (!(this.fieldTemp5 == rhs.fieldTemp5)) {
            println("fieldTemp5 is not equal, the origin is ${this.fieldTemp5}, the value convert from string is ${rhs.fieldTemp5} \n")
            result = false
        }
        if (!(this.fieldTemp6 == rhs.fieldTemp6)) {
            println("fieldTemp6 is not equal, the origin is ${this.fieldTemp6}, the value convert from string is ${rhs.fieldTemp6} \n")
            result = false
        }
        if (!(this.fieldTemp7 == rhs.fieldTemp7)) {
            println("fieldTemp7 is not equal, the origin is ${this.fieldTemp7}, the value convert from string is ${rhs.fieldTemp7} \n")
            result = false
        }
        if (!(this.fieldTemp8 == rhs.fieldTemp8)) {
            println("fieldTemp8 is not equal, the origin is ${this.fieldTemp8}, the value convert from string is ${rhs.fieldTemp8} \n")
            result = false
        }
        if (!(this.fieldTemp9 == rhs.fieldTemp9)) {
            println("fieldTemp9 is not equal\n")
            result = false
        }
        return result
    }
}

class B <: Serializable<B> {
    public var fieldTemp1 : Float16 = 0.0
    public var fieldTemp2 : Float32 = -2.0
    public var fieldTemp3 : Float64 = 433_4155.0
    public var fieldTemp4 : Rune = r'\n'
    public var fieldTemp5 : Bool = true
    public var fieldTemp6 : String = "hello world ${fieldTemp4}}"

    public init(fieldTemp1 : Float16, fieldTemp2 : Float32, fieldTemp3 : Float64, fieldTemp4 : Rune, fieldTemp5 : Bool, fieldTemp6 : String) {
        this.fieldTemp1 = fieldTemp1
        this.fieldTemp2 = fieldTemp2
        this.fieldTemp3 = fieldTemp3
        this.fieldTemp4 = fieldTemp4
        this.fieldTemp5 = fieldTemp5
        this.fieldTemp6 = fieldTemp6
    }

    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("fieldTemp1", fieldTemp1.serialize()))
        dms.add(Field("fieldTemp2", fieldTemp2.serialize()))
        dms.add(Field("fieldTemp3", fieldTemp3.serialize()))
        dms.add(Field("fieldTemp4", fieldTemp4.serialize()))
        dms.add(Field("fieldTemp5", fieldTemp5.serialize()))
        dms.add(Field("fieldTemp6", fieldTemp6.serialize()))
        return dms
    }

    public static func deserialize(dm: DataModel): B {
        let dms = (dm as DataModelStruct).getOrThrow()
        B(dms)
    }

    private init(dms : DataModelStruct) {
          this.fieldTemp1 = Float16.deserialize(dms.get("fieldTemp1"))
          this.fieldTemp2 = Float32.deserialize(dms.get("fieldTemp2"))
          this.fieldTemp3 = Float64.deserialize(dms.get("fieldTemp3"))
          this.fieldTemp4 = Rune.deserialize(dms.get("fieldTemp4"))
          this.fieldTemp5 = Bool.deserialize(dms.get("fieldTemp5"))
          this.fieldTemp6 = String.deserialize(dms.get("fieldTemp6"))
    }
    public operator func ==(rhs : B) : Bool {
        var result = true
        if (!(this.fieldTemp1 == rhs.fieldTemp1)) {
            println("fieldTemp1 is not equal, the origin is ${this.fieldTemp1}, the value convert from string is ${rhs.fieldTemp1} \n")
            result = false
        }
        if (!(this.fieldTemp2 == rhs.fieldTemp2)) {
            println("fieldTemp2 is not equal, the origin is ${this.fieldTemp2}, the value convert from string is ${rhs.fieldTemp2} \n")
            result = false
        }
        if (!(this.fieldTemp3 == rhs.fieldTemp3)) {
            println("fieldTemp3 is not equal, the origin is ${this.fieldTemp3}, the value convert from string is ${rhs.fieldTemp3} \n")
            result = false
        }
        if (!(this.fieldTemp4 == rhs.fieldTemp4)) {
            println("fieldTemp4 is not equal, the origin is ${this.fieldTemp4}, the value convert from string is ${rhs.fieldTemp4} \n")
            result = false
        }
        if (!(this.fieldTemp5 == rhs.fieldTemp5)) {
            println("fieldTemp5 is not equal, the origin is ${this.fieldTemp5}, the value convert from string is ${rhs.fieldTemp5} \n")
            result = false
        }
        if (!(this.fieldTemp6 == rhs.fieldTemp6)) {
            println("fieldTemp6 is not equal, the origin is ${this.fieldTemp6}, the value convert from string is ${rhs.fieldTemp6} \n")
            result = false
        }
        return result
    }
}

class TestSerialization {

    public func run() {
        let temp = "\\\\\\"
        let instances : Array<A> = [A(-10, 10, -20, 20, -30, 30, -40, 40, -50.0, 60.0, 70.0, r'`', true, #"\\"#)]
        var caseID = 1
        var result : Int64 = 0
        for (orign in instances) {
            if (testSerialize(orign) == 1) {
                println("case ${caseID} is failed\n")
                result = 1
            }
        }
        return result
    }

    public func testSerialize(origin : A) : Int64 {
        // 需要覆盖各数据类型的极限值，浮点类型需覆盖NAN和INF，字符串类型需覆盖转义
        let dataModel : DataModel = origin.serialize()
        let jsonValue : JsonValue = dataModel.toJson()
        let stringOriginValue : String = jsonValue.toString()
        println("stringOriginValue"+stringOriginValue + "\n")

        // 暂不考虑安全、可靠等特性
        // 覆盖缩进、特殊的浮点数据以及转义字符串等
        let parseValue : JsonValue = JsonValue.fromStr(stringOriginValue)
        let dataModelValue : DataModel = DataModel.fromJson(jsonValue)
        let originValue : A = A.deserialize(dataModelValue)

        if (origin == originValue) {
            return 0
        }
        return 1
    }
}

main() : Int64 {
    return TestSerialization().run()
}
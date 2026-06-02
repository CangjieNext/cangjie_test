/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args
import stdx.serialization.serialization.*
import std.math.*
import stdx.encoding.json.*

class A <: Serializable<A> {
    public var fieldTemp1: Int8
    public var fieldTemp2: UInt8
    public var fieldTemp3: Int16
    public var fieldTemp4: UInt16
    public var fieldTemp5: Int32
    public var fieldTemp6: UInt32
    public var fieldTemp7: Int64
    public var fieldTemp8: UInt64
    public var fieldTemp9: B
    public init(fieldTemp1: Int8, fieldTemp2: UInt8, fieldTemp3: Int16, fieldTemp4: UInt16, fieldTemp5: Int32,
        fieldTemp6: UInt32, fieldTemp7: Int64, fieldTemp8: UInt64, fieldB1: Float16, fieldB2: Float32, fieldB3: Float64,
        FieldB4: Rune, fieldB5: Bool, FieldB6: String) {
        this.fieldTemp8 = fieldTemp8
        this.fieldTemp2 = fieldTemp2
        this.fieldTemp1 = fieldTemp1
        this.fieldTemp3 = fieldTemp3
        this.fieldTemp6 = fieldTemp6
        this.fieldTemp5 = fieldTemp5
        this.fieldTemp4 = fieldTemp4
        this.fieldTemp7 = fieldTemp7
        this.fieldTemp9 = B(fieldB1, fieldB2, fieldB3, FieldB4, fieldB5, FieldB6)
    }
    public func fieldinit(): Array<Field> {
        var f1 = Field("fieldTemp1", fieldTemp1.serialize())
        var f2 = Field("fieldTemp2", fieldTemp2.serialize())
        var f3 = Field("fieldTemp3", fieldTemp3.serialize())
        var f4 = Field("fieldTemp4", fieldTemp4.serialize())
        var f5 = Field("fieldTemp5", fieldTemp5.serialize())
        var f6 = Field("fieldTemp6", fieldTemp6.serialize())
        var f7 = Field("fieldTemp7", fieldTemp7.serialize())
        var f8 = Field("fieldTemp8", fieldTemp8.serialize())
        var f9 = Field("fieldTemp9", fieldTemp9.serialize())
        var fields: Array<Field> = [f1, f2, f3, f4, f5, f6, f7, f8, f9]
        //测试Field构造器，各种数据类型

        return fields
    }
    public func fielddata(): Array<String> {
        var fd1 = fieldTemp1.serialize().toJson().toString()
        var fd2 = fieldTemp2.serialize().toJson().toString()
        var fd3 = fieldTemp3.serialize().toJson().toString()
        var fd4 = fieldTemp4.serialize().toJson().toString()
        var fd5 = fieldTemp5.serialize().toJson().toString()
        var fd6 = fieldTemp6.serialize().toJson().toString()
        var fd7 = fieldTemp7.serialize().toJson().toString()
        var fd8 = fieldTemp8.serialize().toJson().toString()
        var fd9 = fieldTemp9.serialize().toJson().toString()
        var fielddatas: Array<String> = [fd1, fd2, fd3, fd4, fd5, fd6, fd7, fd8, fd9]
        //测试Field构造器，各种数据类型
        return fielddatas
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
    private init(dms: DataModelStruct) {
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
}

class B <: Serializable<B> {
    public var fieldTemp1: Float16 = 0.0
    public var fieldTemp2: Float32 = -2.0
    public var fieldTemp3: Float64 = 433_4155.0
    public var fieldTemp4: Rune = r'\n'
    public var fieldTemp5: Bool = true
    public var fieldTemp6: String = "hello world ${fieldTemp4}}"

    public init(fieldTemp1: Float16, fieldTemp2: Float32, fieldTemp3: Float64, fieldTemp4: Rune, fieldTemp5: Bool,
        fieldTemp6: String) {
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
    private init(dms: DataModelStruct) {
        this.fieldTemp1 = Float16.deserialize(dms.get("fieldTemp1"))
        this.fieldTemp2 = Float32.deserialize(dms.get("fieldTemp2"))
        this.fieldTemp3 = Float64.deserialize(dms.get("fieldTemp3"))
        this.fieldTemp4 = Rune.deserialize(dms.get("fieldTemp4"))
        this.fieldTemp5 = Bool.deserialize(dms.get("fieldTemp5"))
        this.fieldTemp6 = String.deserialize(dms.get("fieldTemp6"))
    }
}

class TestField {
    public func run(): Int64 {
        let initdata = A(-10, 10, -20, 20, -30, 30, -40, 40, -50.0, 60.0, 70.0, r'`', true, #"\\"#)
        var fields_act = initdata.fieldinit()
        var fieldname: Array<String> = ["fieldTemp1", "fieldTemp2", "fieldTemp3", "fieldTemp4", "fieldTemp5",
            "fieldTemp6", "fieldTemp7", "fieldTemp8", "fieldTemp9"]
        var fielddatas = initdata.fielddata()
        for (i in 0..fields_act.size) {
            var name = fields_act[i].getName()
            var data = fields_act[i].getData().toJson().toString()
            if (name != fieldname[i]) {
                println("name=" + name)
                return 1
            }
            if (data != fielddatas[i]) {
                println("data=" + data)
                return 2
            }
        }
        return 0
    }
}

main(): Int64 {
    return TestField().run()
}

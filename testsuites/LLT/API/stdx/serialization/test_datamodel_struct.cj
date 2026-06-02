/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC:  %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE) EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 

import stdx.serialization.serialization.*
import stdx.encoding.json.*
import std.collection.*
import std.math.*

/*
 * Test description: Test the funcs for DataModelStruct
 * Test class:
 * public class DataModelStruct <: DataModel
 */
@Test
class DataModelStructTest {
    /*
     * Test description: Test DataModelStruct ::serialization
     * Test API:
     * public init()
     * public init(list: ArrayList<Field>)
     */
    @TestCase
    func testDataModelStructInit(): Unit {
        @Expect( DataModelStruct().getFields().size,0)
        @Expect( DataModelStruct(ArrayList<Field>([Field("test", DataModelString("test String!"))])).getFields().size,1)
    }
    /*
     * Test description: Test DataModelStruct ::serialization
     * Test API:
     * public func getFields(): ArrayList<Field>
     */
    @TestCase
    func testDataModelStructGetFields(): Unit {
        var field = Field("test", DataModelString("test String!"))

        @Expect(DataModelStruct(ArrayList<Field>([field])).get("test").toJson().toString(),JsonString("test String!").toString())
    }
    /*
     * Test description: Test DataModelStruct ::serialization
     * Test API:
     * public func add(fie: Field): DataModelStruct
     */
    @TestCase
    func testDataModelStructAdd(): Unit {
        var field = Field("test", DataModelString("test String!"))
        @Expect( DataModelStruct().add(field).getFields().size,1)

        var item1: Float16 = 0.0
        var item2: Float32 = -2.0
        var item3: Float64 = 222222.0
        var item4: Rune = r'\n'
        var item5: Bool = true
        var field1: Field = Field("item1", item1.serialize())
        var field2: Field = Field("item2", item2.serialize())
        var field3: Field = Field("item3", item3.serialize())
        var g = DataModelStruct(ArrayList<Field>([field1, field2, field3]))
        var getFields_result1 = g.getFields()
        @Expect( getFields_result1.size,3)

        var field4: Field = Field("item4", item4.serialize())
        var field5: Field = Field("item5", item5.serialize())
        //func add(fie: Field): DataModelStruct
        var getFields_result3 = g.add(field5).getFields()
        @Expect( getFields_result3.size,4)

        //func get(key: String): DataModel
        var getkey_result1 = g.get("fieldTemp7").toJson().toString() //获取不存在的key
        var getkey_result2 = g.get("item3").toJson().toString() //获取存在的key
        var getkey_result3 = g.get("item5").toJson().toString() //获取新增的key

        @Expect(getkey_result1,"null")
        @Expect(getkey_result2,"222222.000000")
        @Expect(getkey_result3,"true")
    }

    /*
     * Test description: Test DataModelStruct ::serialization
     * Test API:
     * public func get(key: String): DataModel
     */
    @TestCase
    func testDataModelStructGet(): Unit {
        var field = Field("test", DataModelString("test String!"))
        @Expect(DataModelStruct().add(field).get("test").toJson().toString(),JsonString("test String!").toString())
        @Expect(DataModelStruct().get("test") is DataModelNull)
        @Expect(DataModelNull().toJson().toString(),JsonNull().toString())
    }

    /*
     * Test description: Test DataModelStruct ::serialization
     * Test API:
     * func toJson(): JsonValue
     */
    @TestCase
    func testDataModelStructToJson(): Unit {
        @Expect(DataModelStruct(ArrayList<Field>([Field("test",DataModelString("test String!"))])).toJson().toString(),#"{"test":"test String!"}"#)
    }

    /*
     * Test description: Test DataModelStruct ::serialization
     * Test API:
     * static func fromJson(jv: JsonValue): DataModel
     */
    @TestCase
    func testDataModelStructFromJson(): Unit {
        @Expect(DataModel.fromJson(JsonValue.fromStr("{\"test\":\"test String!\"}").asObject()) is DataModelStruct)
    }

    /*
     * Test description: Test DataModelStruct ::serialization
     * Test API:
     * func serialize(): DataModel
     * static func deserialize(dm: DataModel): T
     */
    @TestCase
    func testDataModelStructSerialization(): Unit {
        let instances: Array<A> = [
            A(Int8.Min, 0, Int16.Min, 0, Int32.Min, 0, Int64.Min, 0, Float16.MinNormal, Float32.MinNormal,
                Float64.MinNormal, r'`', true, #"\\"#),
            A(1, 2, 3, 4, 5, 6, 7, 8, Float16.GetE(), Float32.GetE(), Float64.GetE(), r'a', true, "hello"),
            A(1, 2, 3, 4, 5, 6, 7, 8, Float16.MinDenormal, Float32.GetE(), Float64.GetPI(), r'a', true, "hello"),
            A(1, 2, 3, 4, 5, 6, 7, 8, Float16.MinNormal, Float32.GetE(), Float64.GetE(), r'a', true, "hello"),
            A(-10, 10, -20, 20, -30, 30, -40, 40, -50.0, 60.0, 70.0, r'`', true, #"\\"#),
            A(1, 2, 3, 4, 5, 6, 7, 8, Float16.GetPI(), Float32.GetPI(), Float64.GetPI(), r'a', true, "hello")
        ]
        var caseID = 1
        var result: Int64 = 0
        for (origin in instances) {
            let dataModel: DataModel = origin.serialize()
            let jsonValue: JsonValue = dataModel.toJson()
            let stringOriginValue: String = jsonValue.toString()
            let parseValue: JsonValue = JsonValue.fromStr(stringOriginValue)
            let dataModelValue: DataModel = DataModel.fromJson(jsonValue)
            let originValue: A = A.deserialize(dataModelValue)

            if (origin == originValue) {
                @Expect(true)
            } else {
                println("testDataModelStructSerialization case ${caseID} is failed\n")
                @Expect(false)
            }
            caseID++
        }
    }
}

public class A <: Serializable<A> {
    public var item1: Int8
    public var item2: UInt8
    public var item3: Int16
    public var item4: UInt16
    public var item5: Int32
    public var item6: UInt32
    public var item7: Int64
    public var item8: UInt64
    public var item9: B

    public init(
        item1: Int8,
        item2: UInt8,
        item3: Int16,
        item4: UInt16,
        item5: Int32,
        item6: UInt32,
        item7: Int64,
        item8: UInt64,
        fieldB1: Float16,
        fieldB2: Float32,
        fieldB3: Float64,
        FieldB4: Rune,
        fieldB5: Bool,
        FieldB6: String
    ) {
        this.item8 = item8
        this.item2 = item2
        this.item1 = item1
        this.item3 = item3
        this.item6 = item6
        this.item5 = item5
        this.item4 = item4
        this.item7 = item7
        this.item9 = B(fieldB1, fieldB2, fieldB3, FieldB4, fieldB5, FieldB6)
    }

    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("item1", item1.serialize()))
        dms.add(Field("item2", item2.serialize()))
        dms.add(Field("item3", item3.serialize()))
        dms.add(Field("item4", item4.serialize()))
        dms.add(Field("item5", item5.serialize()))
        dms.add(Field("item6", item6.serialize()))
        dms.add(Field("item7", item7.serialize()))
        dms.add(Field("item8", item8.serialize()))
        dms.add(Field("item9", item9.serialize()))
        return dms
    }

    public static func deserialize(dm: DataModel): A {
        let dms = (dm as DataModelStruct).getOrThrow()
        A(dms)
    }

    private init(dms: DataModelStruct) {
        this.item1 = Int8.deserialize(dms.get("item1"))
        this.item2 = UInt8.deserialize(dms.get("item2"))
        this.item3 = Int16.deserialize(dms.get("item3"))
        this.item4 = UInt16.deserialize(dms.get("item4"))
        this.item5 = Int32.deserialize(dms.get("item5"))
        this.item6 = UInt32.deserialize(dms.get("item6"))
        this.item7 = Int64.deserialize(dms.get("item7"))
        this.item8 = UInt64.deserialize(dms.get("item8"))
        this.item9 = B.deserialize(dms.get("item9"))
    }
    public operator func ==(rhs: A): Bool {
        var result = true
        if (!(this.item1 == rhs.item1)) {
            println("item1 is not equal, the origin is ${this.item1}, the value convert from string is ${rhs.item1} \n")
            result = false
        }
        if (!(this.item2 == rhs.item2)) {
            println("item2 is not equal, the origin is ${this.item2}, the value convert from string is ${rhs.item2} \n")
            result = false
        }
        if (!(this.item3 == rhs.item3)) {
            println("item3 is not equal, the origin is ${this.item3}, the value convert from string is ${rhs.item3} \n")
            result = false
        }
        if (!(this.item4 == rhs.item4)) {
            println("item4 is not equal, the origin is ${this.item4}, the value convert from string is ${rhs.item4} \n")
            result = false
        }
        if (!(this.item5 == rhs.item5)) {
            println("item5 is not equal, the origin is ${this.item5}, the value convert from string is ${rhs.item5} \n")
            result = false
        }
        if (!(this.item6 == rhs.item6)) {
            println("item6 is not equal, the origin is ${this.item6}, the value convert from string is ${rhs.item6} \n")
            result = false
        }
        if (!(this.item7 == rhs.item7)) {
            println("item7 is not equal, the origin is ${this.item7}, the value convert from string is ${rhs.item7} \n")
            result = false
        }
        if (!(this.item8 == rhs.item8)) {
            println("item8 is not equal, the origin is ${this.item8}, the value convert from string is ${rhs.item8} \n")
            result = false
        }
        if (!(this.item9 == rhs.item9)) {
            println("item9 is not equal\n")
            result = false
        }
        return result
    }
}

public class B <: Serializable<B> {
    public var item1: Float16 = 0.0
    public var item2: Float32 = -2.0
    public var item3: Float64 = 433_4155.0
    public var item4: Rune = r'\n'
    public var item5: Bool = true
    public var item6: String = "hello world ${item4}}"

    public init(item1: Float16, item2: Float32, item3: Float64, item4: Rune, item5: Bool, item6: String) {
        this.item1 = item1
        this.item2 = item2
        this.item3 = item3
        this.item4 = item4
        this.item5 = item5
        this.item6 = item6
    }

    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("item1", item1.serialize()))
        dms.add(Field("item2", item2.serialize()))
        dms.add(Field("item3", item3.serialize()))
        dms.add(Field("item4", item4.serialize()))
        dms.add(Field("item5", item5.serialize()))
        dms.add(Field("item6", item6.serialize()))
        return dms
    }

    public static func deserialize(dm: DataModel): B {
        let dms = (dm as DataModelStruct).getOrThrow()
        B(dms)
    }

    private init(dms: DataModelStruct) {
        this.item1 = Float16.deserialize(dms.get("item1"))
        this.item2 = Float32.deserialize(dms.get("item2"))
        this.item3 = Float64.deserialize(dms.get("item3"))
        this.item4 = Rune.deserialize(dms.get("item4"))
        this.item5 = Bool.deserialize(dms.get("item5"))
        this.item6 = String.deserialize(dms.get("item6"))
    }
    public operator func ==(rhs: B): Bool {
        var result = true
        if (!(this.item1 == rhs.item1)) {
            println("item1 is not equal, the origin is ${this.item1}, the value convert from string is ${rhs.item1} \n")
            result = false
        }
        if (!(this.item2 == rhs.item2)) {
            println("item2 is not equal, the origin is ${this.item2}, the value convert from string is ${rhs.item2} \n")
            result = false
        }
        if (!(this.item3 == rhs.item3)) {
            println("item3 is not equal, the origin is ${this.item3}, the value convert from string is ${rhs.item3} \n")
            result = false
        }
        if (!(this.item4 == rhs.item4)) {
            println("item4 is not equal, the origin is ${this.item4}, the value convert from string is ${rhs.item4} \n")
            result = false
        }
        if (!(this.item5 == rhs.item5)) {
            println("item5 is not equal, the origin is ${this.item5}, the value convert from string is ${rhs.item5} \n")
            result = false
        }
        if (!(this.item6 == rhs.item6)) {
            println("item6 is not equal, the origin is ${this.item6}, the value convert from string is ${rhs.item6} \n")
            result = false
        }
        return result
    }
}

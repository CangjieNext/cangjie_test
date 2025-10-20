/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
import stdx.serialization.serialization.*
import std.math.*
import stdx.encoding.json.*

class A <: Serializable<A> {
    public var fieldTemp1: Int8
    public var fieldTemp2: UInt8
    public var fieldTemp3: String
    public init(fieldTemp1: Int8, fieldTemp2: UInt8, fieldTemp3: String) {
        this.fieldTemp1 = fieldTemp1
        this.fieldTemp2 = fieldTemp2
        this.fieldTemp3 = fieldTemp3
    }

    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("fieldTemp1", fieldTemp1.serialize()))
        dms.add(Field("fieldTemp2", fieldTemp2.serialize()))
        dms.add(Field("fieldTemp3", fieldTemp3.serialize()))
        return dms
    }

    public static func deserialize(dm: DataModel): A {
        let dms = (dm as DataModelStruct).getOrThrow()
        A(dms)
    }

    private init(dms: DataModelStruct) {
        this.fieldTemp1 = Int8.deserialize(dms.get("fieldTemp1"))
        this.fieldTemp2 = UInt8.deserialize(dms.get("fieldTemp2"))
        this.fieldTemp3 = String.deserialize(dms.get("fieldTemp3"))
    }

    public operator func ==(rhs: A): Bool {
        var result = true
        if (!(this.fieldTemp1 == rhs.fieldTemp1)) {
            print(
                "fieldTemp1 is not equal, the origin is ${this.fieldTemp1}, the value convert from string is ${rhs.fieldTemp1} \n")
            result = false
        }
        if (!(this.fieldTemp2 == rhs.fieldTemp2)) {
            print(
                "fieldTemp2 is not equal, the origin is ${this.fieldTemp2}, the value convert from string is ${rhs.fieldTemp2} \n")
            result = false
        }
        if (!(this.fieldTemp3 == rhs.fieldTemp3)) {
            print(
                "fieldTemp3 is not equal, the origin is ${this.fieldTemp3}, the value convert from string is ${rhs.fieldTemp3} \n")
            result = false
        }
        return result
    }
}

class Testjsonarray {
    /*
          func toJsonString(): String;
          func toString(): String;
          func size: Int64;
          func add(jv: JsonValue);
          func get(index: Int64): Option<JsonValue>;
          func getItems(): ArrayList<JsonValue>
     */
    //init()
    public func testinit1(jsonarray: JsonArray, exp_size!: Int64 = 0): Int64 {
        var size1 = jsonarray.size()
        if (size1 != exp_size) {
            println("size1=" + size1.toString())
            return 1
        }
        return 0
    }
    public func testadd(jsonValue: JsonValue, jsonarray: JsonArray): Int64 {
        var size1 = jsonarray.size()
        jsonarray.add(jsonValue)
        var size2 = jsonarray.size()
        if (size2 != size1 + 1) {
            println("size1-1=" + size1.toString())
            println("size2-2=" + size2.toString())
            return 1
        }
        return 0
    }
    public func testget(exp_data: Array<String>, jsonarray: JsonArray): Int64 {
        for (i in 0..jsonarray.size()) {
            var get_result = jsonarray.get(i).getOrThrow().toString()
            if (get_result != exp_data[i]) {
                println(get_result)
                println(exp_data[i])
                return 1
            }
        }
        return 0
    }
    public func testgetItems(exp_jsonvalue: Array<String>, jsonarray: JsonArray): Int64 {
        var items = jsonarray.getItems()
        for (i in 0..items.size) {
            var item_data = items[i].toString()
            if (item_data != exp_jsonvalue[i]) {
                println("exp_jsonvalue[i]=" + exp_jsonvalue[i])
                return 1
            }
        }
        return 0
    }
    public func testtoString(exp_jsonvalue: String, jsonarray: JsonArray): Int64 {
        var toString = jsonarray.toString()
        if (toString != exp_jsonvalue) {
            println("exp_jsonvalue1()=" + exp_jsonvalue)
            println("toString1=" + toString)
            return 1
        }
        return 0
    }
    public func testjsonString(expString: String, jsonarray: JsonArray): Int64 {
        var toJsonString = jsonarray.toJsonString()
        if (toJsonString != expString) {
            println("str1=" + toJsonString)
            println("str2=" + expString)
            return 1
        }
        return 0
    }
}

func createjsonvalue(param1: Int8, param2: UInt8, param3: String): JsonValue {
    let instances = A(param1, param2, param3)
    let dataModel: DataModel = instances.serialize()
    let jsonValue: JsonValue = dataModel.toJson()
    return jsonValue
}

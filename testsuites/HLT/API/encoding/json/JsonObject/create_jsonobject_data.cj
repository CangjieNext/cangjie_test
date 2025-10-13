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
internal import stdx.encoding.json.*
internal import std.collection.*

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

class Testjsonobject {
    /*
          init();
          init(map: HashMap<String,JsonValue>);
          func toJsonString(): String;
          func toString(): String;
          func size(): Int64;
          func containsKey(key: String): Bool;
          func put(key: String, v: JsonValue);
          func get(key: String): Option<JsonValue>;
          func getFields(): HashMap<String,JsonValue>
     */
    public func testinit(json: JsonObject, exp_size!: Int64 = 0): Int64 {
        var size1 = json.size()
        if (size1 != exp_size) {
            println("size1=" + size1.toString())
            return 1
        }
        return 0
    }
    public func testtoString(json: JsonObject, exp_jsonvalue: String): Int64 {
        var toString = json.toString()
        if (toString != exp_jsonvalue) {
            println("exp_jsonvalue1=" + exp_jsonvalue)
            println("toString=" + toString)
            return 1
        }
        return 0
    }
    public func testjsonString(json: JsonObject, expString: String): Int64 {
        var toJsonString = json.toJsonString()
        if (toJsonString != expString) {
            println("str1=" + toJsonString)
            println("str2=" + expString)
            return 1
        }
        return 0
    }
    public func testcontainsKey(json: JsonObject, all_keys: Array<String>, exp_re: Bool): Int64 {
        if (json.size() == 0 && all_keys.size == 0) {
            return 0
        } else {
            for (key in all_keys) {
                var re = json.containsKey(key)
                if (re != exp_re) {
                    return 1
                }
            }
        }
        return 0
    }
    public func testput(json: JsonObject, key: String, v: JsonValue): Int64 {
        var size1 = json.size()
        json.put(key, v)
        var size2 = json.size()
        if (size2 != size1 + 1) {
            println("size2=" + size2.toString())
            return 1
        }
        if (json.containsKey(key) != true) {
            return 2
        }
        if (json.get(key).getOrThrow().toString() != v.toString()) {
            return 3
        }
        return 0
    }
    public func testget(json: JsonObject, key: String, exp_value: String): Int64 {
        var act_v = json.get(key).getOrThrow().toString()
        if (act_v != exp_value) {
            return 1
        }
        return 0
    }
    public func testgetFields(json: JsonObject, exp_field: HashMap<String, JsonValue>): Int64 {
        var items = json.getFields()
        if (items.size != exp_field.size) {
            return 1
        }
        for (key in items.keys()) {
            var act_value = match (items.get(key)) {
                case Some(x) => x.toString()
                case None => "value is null"
            }
            var exp_value = match (exp_field.get(key)) {
                case Some(x) => x.toString()
                case None => "value is null"
            }
            if (act_value != exp_value) {
                return 1
            }
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

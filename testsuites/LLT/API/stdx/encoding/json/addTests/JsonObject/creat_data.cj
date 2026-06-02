/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
import std.collection.*
import stdx.encoding.json.*
import stdx.serialization.serialization.*

class JsonModule <: Serializable<JsonModule> {
    public var item1: Int8
    public var item2: UInt8
    public var item3: String
    public init(item1: Int8, item2: UInt8, item3: String) {
        this.item1 = item1
        this.item2 = item2
        this.item3 = item3
    }

    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("item1", item1.serialize()))
        dms.add(Field("item2", item2.serialize()))
        dms.add(Field("item3", item3.serialize()))
        return dms
    }

    public static func deserialize(dm: DataModel): JsonModule {
        let dms = (dm as DataModelStruct).getOrThrow()
        JsonModule(dms)
    }

    private init(dms: DataModelStruct) {
        this.item1 = Int8.deserialize(dms.get("item1"))
        this.item2 = UInt8.deserialize(dms.get("item2"))
        this.item3 = String.deserialize(dms.get("item3"))
    }

    public operator func ==(rhs: JsonModule): Bool {
        var result = true
        if (!(this.item1 == rhs.item1)) {
            print("item1 is not equal, the origin is ${this.item1}, the value convert from string is ${rhs.item1} \n")
            result = false
        }
        if (!(this.item2 == rhs.item2)) {
            print("item2 is not equal, the origin is ${this.item2}, the value convert from string is ${rhs.item2} \n")
            result = false
        }
        if (!(this.item3 == rhs.item3)) {
            print("item3 is not equal, the origin is ${this.item3}, the value convert from string is ${rhs.item3} \n")
            result = false
        }
        return result
    }
}

class TestJsonObject {
    /*
     * init()
     * init(map: HashMap<String, JsonValue>);
     * func toJsonString(): String
     * func toString(): String
     * func size(): Int64
     * func containsKey(key: String): Bool
     * func put(key: String, v: JsonValue)
     * func get(key: String): Option<JsonValue>
     * func getFields(): HashMap<String,JsonValue>
     */
    public func testInit(jsonObject: JsonObject, exp_size!: Int64 = 0): Int64 {
        var size = jsonObject.size()
        if (size != exp_size) {
            println("size = " + size.toString())
            return 1
        }
        return 0
    }

    public func testToString(jsonObject: JsonObject, exp_jsonValue: String): Int64 {
        var toString = jsonObject.toString()
        if (toString != exp_jsonValue) {
            println("exp_jsonValue =" + exp_jsonValue)
            println("toString =" + toString)
            return 1
        }
        return 0
    }

    public func testToJsonString(jsonObject: JsonObject, expString: String): Int64 {
        var toJsonString = jsonObject.toJsonString()
        if (toJsonString != expString) {
            println("str1=" + toJsonString)
            println("str2=" + expString)
            return 1
        }
        return 0
    }

    public func testContainsKey(jsonObject: JsonObject, all_keys: Array<String>, exp_re: Bool): Int64 {
        if (jsonObject.size() == 0 && all_keys.size == 0) {
            return 0
        } else {
            for (key in all_keys) {
                var re = jsonObject.containsKey(key)
                if (re != exp_re) {
                    return 1
                }
            }
        }
        return 0
    }

    public func testPut(jsonObject: JsonObject, key: String, jsonValue: JsonValue): Int64 {
        var size1 = jsonObject.size()
        jsonObject.put(key, jsonValue)
        var size2 = jsonObject.size()
        if (size2 != size1 + 1) {
            println("size2=" + size2.toString())
            return 1
        }
        if (jsonObject.containsKey(key) != true) {
            return 2
        }
        if (jsonObject.get(key).getOrThrow().toString() != jsonValue.toString()) {
            return 3
        }
        return 0
    }

    public func testGet(jsonObject: JsonObject, key: String, exp_value: String): Int64 {
        var act_v = jsonObject.get(key).getOrThrow().toString()
        if (act_v != exp_value) {
            return 1
        }
        return 0
    }

    public func testGetFields(jsonObject: JsonObject, exp_field: HashMap<String, JsonValue>): Int64 {
        var items = jsonObject.getFields()
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

func creatJsonValue(param1: Int8, param2: UInt8, param3: String): JsonValue {
    let jsonModule = JsonModule(param1, param2, param3)
    let dataModel: DataModel = jsonModule.serialize()
    let jsonValue: JsonValue = dataModel.toJson()
    return jsonValue
}

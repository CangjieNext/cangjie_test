/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args
import stdx.serialization.serialization.*
import std.math.*
import stdx.encoding.json.*
import std.collection.*

class Testdatamodel {
    public var fieldTemp1: Float16 = 0.0
    public var fieldTemp2: Float32 = -2.0
    public var fieldTemp3: Float64 = 4334155.0

    public var fieldTemp4: Rune = '\n'
    public var fieldTemp5: Bool = true
    public var field4: Field = Field("fieldTemp4", fieldTemp4.serialize())
    public var field5: Field = Field("fieldTemp5", fieldTemp5.serialize())
    public func makefieldbuffer(): ArrayList<Field> {
        var field1: Field = Field("fieldTemp1", fieldTemp1.serialize())
        var field2: Field = Field("fieldTemp2", fieldTemp2.serialize())
        var field3: Field = Field("fieldTemp3", fieldTemp3.serialize())
        return ArrayList<Field>([field1, field2, field3])
    }
    public func testinit(): Int64 {
        var result: Int64 = 0
        //init()
        var g = DataModelStruct()
        //func getFields(): ArrayList<Field>
        var getFields_result1 = g.getFields()
        if (getFields_result1.size != 0) {
            result = 1
        }
        //func add(fie: Field): DataModelStruct
        var getFields_result2 = g.add(field5).getFields()
        if (getFields_result2.size != 1) {
            result = 1
        }
        //func get(key: String): DataModel
        var getkey_result1 = g.get("").toJson().toString()
        var getkey_result2 = g.get("fieldTemp5").toJson().toString()
        if (getkey_result1 != "null" || getkey_result2 != "true") {
            println("getkey_result1" + getkey_result1)
            println("getkey_result2" + getkey_result2)
            result = 2
        }
        return result
    }
    public func testinitParam(e: ArrayList<Field>): Int64 {
        var result: Int64 = 0
        //init(list: ArrayList<Field>)
        var g = DataModelStruct(e)
        //func getFields(): ArrayList<Field>
        var getFields_result1 = g.getFields()
        if (getFields_result1.size != e.size) {
            result = 1
        }
        print("getFields_result1.size=")
        println(getFields_result1.size)
        //func add(fie: Field): DataModelStruct
        var getFields_result2 = g.add(field5).getFields() //添加不存在的field
        var getFields_result3 = g.add(field5).getFields() //添加已有的field
        if (getFields_result3.size != e.size) {
            result = 1
        }
        print("getFields_result3.size=")
        print(getFields_result3.size)
        //func get(key: String): DataModel
        var getkey_result1 = g.get("fieldTemp7").toJson().toString() //获取不存在的key
        var getkey_result2 = g.get("fieldTemp3").toJson().toString() //获取存在的key
        var getkey_result3 = g.get("fieldTemp5").toJson().toString() //获取新增的key
        if (getkey_result1 != "null" || getkey_result2 != "4334155.000000" || getkey_result3 != "true") {
            println("getkey_result1=" + getkey_result1)
            println("getkey_result2=" + getkey_result2)
            println("getkey_result3=" + getkey_result3)
            result = 2
        }
        return result
    }
}

main(): Int64 {
    var test = Testdatamodel()
    var test_result1: Int64 = test.testinit()
    var test_result2: Int64 = test.testinitParam(test.makefieldbuffer())
    if (test_result1 != 0 || test_result2 != 0) {
        return 1
    }
    return 0
}

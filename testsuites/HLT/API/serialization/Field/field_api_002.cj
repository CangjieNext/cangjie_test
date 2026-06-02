/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args
import stdx.serialization.serialization.*
import std.math.*
import stdx.encoding.json.*

class A <: Serializable<A> {
    public var fieldTemp1: String
    public var fieldTemp2: String
    public init(fieldTemp1: String, fieldTemp2: String) {
        this.fieldTemp2 = fieldTemp2
        this.fieldTemp1 = fieldTemp1
    }
    public func fieldinit(): Array<Field> {
        var f1 = Field("fieldTemp1", fieldTemp1.serialize())
        var f2 = Field("fieldTemp2", fieldTemp2.serialize())
        var fields: Array<Field> = [f1, f2]
        //测试Field构造器，各种数据类型
        return fields
    }
    public func fielddata(): Array<String> {
        var fd1 = fieldTemp1.serialize().toJson().toString()
        var fd2 = fieldTemp2.serialize().toJson().toString()
        var fielddatas: Array<String> = [fd1, fd2]
        //测试Field构造器，各种数据类型
        return fielddatas
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("fieldTemp1", fieldTemp1.serialize()))
        dms.add(Field("fieldTemp2", fieldTemp2.serialize()))
        return dms
    }

    public static func deserialize(dm: DataModel): A {
        let dms = (dm as DataModelStruct).getOrThrow()
        A(dms)
    }
    private init(dms: DataModelStruct) {
        this.fieldTemp1 = String.deserialize(dms.get("fieldTemp1"))
        this.fieldTemp2 = String.deserialize(dms.get("fieldTemp2"))
    }
}

class TestField {
    public func run(): Int64 {
        let initdata = A("null", "\"null\"")
        var fields_act = initdata.fieldinit()
        var fieldname: Array<String> = ["fieldTemp1", "fieldTemp2"]
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

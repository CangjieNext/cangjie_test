/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %overflow_wrapping %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args 2>&1 | compare %f
// ASSERT: scan age: 123, name: zhangsan, score: 100.0

import stdx.serialization.serialization.*
import stdx.encoding.json.*

class Abc <: Serializable<Abc> & ToString {
    var name: String = "Abcde"
    var age: Int64 = 555
    var score: Float64 = 90.5

    public init() {}

    public init(name: String, age: Int64, score: Float64) {
        this.name = name
        this.age = age
        this.score = score
    }

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(field<String>("name", name))
            .add(field<Int64>("age", age))
            .add(field<Float64>("score", this.score))
    }

    public static func deserialize(dm: DataModel): Abc {
        var dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var result = Abc()
        result.name = String.deserialize(dms.get("name"))
        result.age = Int64.deserialize(dms.get("age"))
        result.score = Float64.deserialize(dms.get("score"))
        return result
    }

    public func toString(): String {
        return "age: ${age}, name: ${name}, score: ${score}"
    }
}

main(): Int64 {
    let abcStr = ##"{"age": 123, "name": "zhangsan", "score": 100}"##
    let objModel = DataModel.fromJson(JsonValue.fromStr(abcStr))
    let abc = Abc.deserialize(objModel)
    println(abc)
    0
}

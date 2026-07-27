/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args

import stdx.encoding.json.*
import std.io.*
import std.time.*
import std.convert.*
import std.collection.*
import stdx.serialization.serialization.*

let reps = 1000000
class Data <: Serializable<Data> {
    var value1: Bool
    var value2: Int32
    var value3: Float32
    var value4: String

    public init(value1: Bool, value2: Int32, value3: Float32, value4: String) {
        this.value1 = value1
        this.value2 = value2
        this.value3 = value3
        this.value4 = value4
    }

    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("value1", value1.serialize()))
        dms.add(Field("value2", value2.serialize()))
        dms.add(Field("value3", value3.serialize()))
        dms.add(Field("value4", value4.serialize()))
        return dms
    }

    static public func deserialize(dm: DataModel): Data {
        let dms = (dm as DataModelStruct).getOrThrow()
        Data(dms)
    }

    private init(dms: DataModelStruct) {
        this.value1 = Bool.deserialize(dms.get("value1"))
        this.value2 = Int32.deserialize(dms.get("value2"))
        this.value3 = Float32.deserialize(dms.get("value3"))
        this.value4 = String.deserialize(dms.get("value4"))
    }

    public operator func ==(rhs: Data): Bool {
        var result = true
        if (!(this.value1 == rhs.value1)) {
            result = false
        }
        return result
    }
}

func setUp(): JsonObject {
    var instances = Data(true, 3, 3.14, "abc")
    var dataModel: DataModel = instances.serialize()
    var jsonValue: JsonValue = dataModel.toJson()
    var hashmap = HashMap<String, JsonValue>([("abc", jsonValue)])
    var jsonObject = JsonObject(hashmap)
    return jsonObject
}

func benchmarkJsonObject2JsonStr(jsonObject: JsonObject) {
    for (i in 0..reps) {
        jsonObject.toJsonString()
    }
}

func timeBenchmarkJsonObject2JsonStr() {
    var jsonObject = setUp()

    var startTime = DateTime.now()
    benchmarkJsonObject2JsonStr(jsonObject)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    println("BenchmarkJsonObject2JsonStr: " + perTime.format(".2") + " ns/op")
}

main(): Int64 {
    timeBenchmarkJsonObject2JsonStr()
    return 0
}

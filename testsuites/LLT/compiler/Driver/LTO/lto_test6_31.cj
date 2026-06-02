// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %set_stdx_path %run %run_opt %output %run_args

internal import stdx.serialization.serialization.*
internal import std.math.*
internal import stdx.encoding.json.*

class Abc <: Serializable<Abc> {
    var name: String = "Abcde"
    public func serialize(): DataModel {
        return DataModelStruct().add(field<String>("name", name))
    }
    public static func deserialize(dm: DataModel): Abc {
        var dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var result = Abc()
        result.name = String.deserialize(dms.get("name"))
        return result
    }
}

main() {
    var dd = Abc()
    var aa: JsonValue = dd.serialize().toJson()
    var bb: JsonObject = (aa as JsonObject).getOrThrow()
    var v1 = (bb.get("name").getOrThrow() as JsonString).getOrThrow()
    if (v1.getValue() == "Abcde") {
        return 0
    }
    return 1
}

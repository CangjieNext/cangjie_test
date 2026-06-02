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

import stdx.encoding.json.*
import stdx.serialization.serialization.*

public class A <: ToJson {
    public func toJson(): JsonValue {
        return JsonNull()
    }
    public static func fromJson(jv: JsonValue): DataModel {
        return DataModel.fromJson(jv)
    }
}

main(): Int64 {
    var a = A()
    let tostring = a.toJson().toString()
    if (tostring != "null") {
        println("tostring=" + tostring)
        return 1
    }
    var json = JsonNull()
    let fromJson = A.fromJson(json).toJson().toString()
    if (fromJson != "null") {
        println("fromJson=" + tostring)
        return 2
    }
    return 0
}

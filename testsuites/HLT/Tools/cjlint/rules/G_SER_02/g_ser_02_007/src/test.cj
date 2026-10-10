/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*

class MySerializeDemo <: Serializable<MySerializeDemo> {
    var value: Int64
    var count: Int64

    init(v: Int64, c: Int64) {
        value = if (v >= 0) { v } else { 0 }
        count = if (c >= 0) { c } else { 0 }
    }

    private init(s: DataModelStruct) {
        let v = Int64.deserialize(s.get("value"))
        value = if (v >= 0) { v } else { 0 }
        count = Int64.deserialize(s.get("count"))
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int64>("value", value)).add(field<Int64>("count", count))
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        MySerializeDemo(d)
    }
}

main() {
    0
}

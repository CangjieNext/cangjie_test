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

    init(v: Int64) {
        value = v
    }

    public func serialize(): DataModel {
        DataModelStruct().add(field<Int64>("value", value))
    }

    private init(s: DataModelStruct) {
        let v = Int16.deserialize(s.get("value"))
        value = Int64(v)
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        MySerializeDemo(d)
    }
}

main() {
    0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*

struct MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value: Int64 = 0

    public init(v: Int64) {
        value = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int64>("value", value))
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value = Int64.deserialize(d.get("value"))
        MySerializeDemo(4)
    }
}

main(){}

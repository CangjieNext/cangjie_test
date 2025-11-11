/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*

class MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value01 : Int32 = 0
    public static var value02 : Int16 = 0

    public init(v1: Int32,v2: Int16) {
        value01 = if (v1 >= 0) {
            v1
        } else {
            0
        }
        value02 = if (v2 >= 0) {
            v2
        } else {
            0
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int32>("value01", value01)).add(field<Int16>("value02", value02))
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value01 = Int32.deserialize(d.get("value01"))
        value02 = Int16.deserialize(d.get("value02"))
        MySerializeDemo(4,4)
    }
}

main(){}

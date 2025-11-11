/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*

class MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value01 : Int8 = 0
    public static var value02 : UInt16 = 0
    public static var value03 : UInt64 = 0
    public static var value04 : UInt32 = 0
    public static var value05 : UInt8 = 0

    public init(v1: Int8,v2: UInt16,v3: UInt64,v4: UInt32,v5: UInt8) {
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
        value03 = if (v3 >= 0) {
            v3
        } else {
            0
        }
        value04 = if (v4 >= 0) {
            v4
        } else {
            0
        }
        value05 = if (v5 >= 0) {
            v5
        } else {
            0
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int8>("value01", value01)).add(field<UInt16>("value02", value02)).add(field<UInt64>("value03", value03)).add(field<UInt32>("value04", value04)).add(field<UInt8>("value05", value05))
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value01 = Int8.deserialize(d.get("value01"))
        value02 = UInt16.deserialize(d.get("value02"))
        value03 = UInt64.deserialize(d.get("value03"))
        value04 = UInt32.deserialize(d.get("value04"))
        value05 = UInt8.deserialize(d.get("value05"))
        MySerializeDemo(4,4,1,2,3)
    }
}

main(){}

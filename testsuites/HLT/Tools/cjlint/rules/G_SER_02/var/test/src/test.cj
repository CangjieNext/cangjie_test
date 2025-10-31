/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*
import collection.collection.*

class MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value02 : ArrayList<Int64> = ArrayList<Int64>(10)
    public init(v2: ArrayList<Int64>) {
        value02 = if (v2[0] >= 0) {
            v2
        } else {
            ArrayList<Int64>(10)
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<ArrayList<Int64>>("value02", value02))
    }
    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value02 = ArrayList<Int64>.deserialize(d.get("value02"))
        MySerializeDemo(ArrayList<Int64>(10))
    }
}

main(){}

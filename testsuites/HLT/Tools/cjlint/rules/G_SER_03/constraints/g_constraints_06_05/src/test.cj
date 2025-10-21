/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}
import std.collection.*

class MySerialize <: Serializable<MySerialize> {
    public static var value:Int64 =9
    public static var value2:Int32 =7

    public init(v: Int64) {
        value = v
    }

    public func serialize(): DataModel {
        var dm1=DataModelStruct().add(field<Int64>("value", value))
        var dm2=DataModelStruct().add(field<Int32>("value2", value2))
        var arr:ArrayList<DataModel>=ArrayList<DataModel>([dm1,dm2])
        return arr[0]
    }

    private init(s: DataModelStruct) {
        var v = Int64.deserialize(s.get("value"))
        var v2 = Int32.deserialize(s.get("value2"))
    }

    public static func deserialize(s: DataModel): MySerialize {
        let d = (s as DataModelStruct).getOrThrow()
        return MySerialize(d)
    }
}

main(){}


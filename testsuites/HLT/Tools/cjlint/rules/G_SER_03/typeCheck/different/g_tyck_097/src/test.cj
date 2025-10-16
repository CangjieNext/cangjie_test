import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}
import std.collection.*

class MySerialize <: Serializable<MySerialize> {
    public static var value:ArrayList<HashMap<String, UInt16>> =ArrayList<HashMap<String, UInt16>>([HashMap<String, UInt16>([("S",4)])])

    public init(v: ArrayList<HashMap<String, UInt16>>) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<ArrayList<HashMap<String, UInt16>>>("value", value))
    }

    private init(s: DataModelStruct) {
        var v =ArrayList<HashMap<String, Int16>>.deserialize(s.get("value"))
    }

    public static func deserialize(s: DataModel): MySerialize {
        let d = (s as DataModelStruct).getOrThrow()
        return MySerialize(d)
    }
}

main(){}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

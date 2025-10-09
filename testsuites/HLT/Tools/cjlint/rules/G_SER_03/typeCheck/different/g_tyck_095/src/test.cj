import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}
import std.collection.*

class MySerialize <: Serializable<MySerialize> {
    public static var value:ArrayList<ArrayList<Int8>> =ArrayList<ArrayList<Int8>>([ArrayList<Int8>([2]),ArrayList<Int8>([4])])
    public init(v: ArrayList<ArrayList<Int8>>) {
        value = v
    }
    public func serialize(): DataModel {
        return DataModelStruct().add(field<ArrayList<ArrayList<Int8>>>("value", value))
    }
    private init(s: DataModelStruct) {
        var v = ArrayList<ArrayList<UInt8>>.deserialize(s.get("value"))
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

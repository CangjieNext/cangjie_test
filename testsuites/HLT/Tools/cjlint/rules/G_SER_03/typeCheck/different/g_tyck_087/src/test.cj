import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}
import std.collection.*

class MySerialize <: Serializable<MySerialize> {
    public static var value: Array<HashMap<String, Int64>> = [HashMap<String, Int64>([("d",34)])]

    public init(v: Array<HashMap<String, Int64>>) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Array<HashMap<String, Int64>>>("value", value))
    }

    private init(s: DataModelStruct) {
        var v = Array<HashMap<String, Int32>>.deserialize(s.get("value"))
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

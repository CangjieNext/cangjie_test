import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}
import std.collection.ArrayList

class MySerialize <: Serializable<MySerialize> {
    public static var value:ArrayList<ArrayList<String>> =ArrayList<ArrayList<String>>([ArrayList<String>(["aa"]),ArrayList<String>(["bb"])])

    public init(v: ArrayList<ArrayList<String>>) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<ArrayList<ArrayList<String>>>("value", value))
    }

    private init(s: DataModelStruct) {
        var v = ArrayList<ArrayList<String>>.deserialize(s.get("value"))
        value = v
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

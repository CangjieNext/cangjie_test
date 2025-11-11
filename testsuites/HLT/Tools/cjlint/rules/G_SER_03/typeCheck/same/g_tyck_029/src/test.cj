/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}
import std.collection.{ArrayList, HashMap}

class MySerialize <: Serializable<MySerialize> {
    public static var value:ArrayList<HashMap<Int64, String>>=ArrayList<HashMap<Int64, String>>([HashMap<Int64, String>([(5,"a")]),HashMap<Int64, String>([(6,"b")])])

    public init(v: ArrayList<HashMap<Int64, String>>) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<ArrayList<HashMap<Int64, String>>>("value", value))
    }

    private init(s: DataModelStruct) {
        var v = ArrayList<HashMap<Int64, String>>.deserialize(s.get("value"))
        value = v
    }

    public static func deserialize(s: DataModel): MySerialize {
        let d = (s as DataModelStruct).getOrThrow()
        return MySerialize(d)
    }
}

main(){}

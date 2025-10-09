import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}
import std.collection.{ArrayList}

class MySerialize <: Serializable<MySerialize> {
    public static var value:ArrayList<Option<Bool>> =ArrayList<Option<Bool>>([Some(true),Some(false),None<Bool>])

    public init(v: ArrayList<Option<Bool>>) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<ArrayList<Option<Bool>>>("value", value))
    }

    private init(s: DataModelStruct) {
        var v = ArrayList<Option<Bool>>.deserialize(s.get("value"))
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

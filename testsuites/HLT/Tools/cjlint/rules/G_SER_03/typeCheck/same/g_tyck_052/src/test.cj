/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}
import std.collection.{HashMap, HashSet}

class MySerialize <: Serializable<MySerialize> {
    public static var value:HashMap<String,HashSet<UInt64>> =HashMap<String,HashSet<UInt64>>([("a",HashSet<UInt64>([2,3])),("b",HashSet<UInt64>([4,5]))])

    public init(v: HashMap<String,HashSet<UInt64>>) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<HashMap<String,HashSet<UInt64>>>("value", value))
    }

    private init(s: DataModelStruct) {
        var v = HashMap<String,HashSet<UInt64>>.deserialize(s.get("value"))
        value = v
    }

    public static func deserialize(s: DataModel): MySerialize {
        let d = (s as DataModelStruct).getOrThrow()
        return MySerialize(d)
    }
}

main(){}

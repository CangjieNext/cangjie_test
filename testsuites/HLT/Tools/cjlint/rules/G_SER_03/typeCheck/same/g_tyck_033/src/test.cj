/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}
import std.collection.HashSet

class MySerialize <: Serializable<MySerialize> {
    public static var value:HashSet<Float32> =HashSet<Float32>([Float32(8),Float32(4)])

    public init(v: HashSet<Float32>) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<HashSet<Float32>>("value", value))
    }

    private init(s: DataModelStruct) {
        var v = HashSet<Float32>.deserialize(s.get("value"))
        value = v
    }

    public static func deserialize(s: DataModel): MySerialize {
        let d = (s as DataModelStruct).getOrThrow()
        return MySerialize(d)
    }
}

main(){}

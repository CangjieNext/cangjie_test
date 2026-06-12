/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}


class MySerialize <: Serializable<MySerialize> {
    public static var value:Int64 =9

    public init(v: Int64) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int64>("value", value))
    }
    public static func deserialize(s: DataModel): MySerialize {
        let d = Int64.deserialize((s as DataModelStruct).getOrThrow().get("value"))
        return MySerialize(d)
    }
}

main(){}


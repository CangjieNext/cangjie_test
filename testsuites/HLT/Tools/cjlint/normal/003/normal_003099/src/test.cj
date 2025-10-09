import stdx.serialization.serialization.*

class MySerialize <: Serializable<MySerialize> {
    public static var value: Int32 = 0

    public init(v: Int32) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int32>("value", value))
    }

    private init(s: DataModelStruct) {
        var v = Int64.deserialize(s.get("value"))
    }

    public static func deserialize(s: DataModel): MySerialize {// cjlint-ignore !G.SER.03
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

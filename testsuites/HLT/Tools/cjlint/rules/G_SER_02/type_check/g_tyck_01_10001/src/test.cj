import stdx.serialization.serialization.*

class MySerializeDemo04 <: Serializable<MySerializeDemo04> {
    var value04: Int64

    init(v: Int64) {
        value04 = if (v >= 0) { v } else { 0 }
    }

    private init(s: DataModelStruct) {
        value04 = Int64.deserialize(s.get("value04"))
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int64>("value04", value04))
    }

    public static func deserialize(s: DataModel): MySerializeDemo04 {
        let d = (s as DataModelStruct).getOrThrow()
        MySerializeDemo04(d)
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

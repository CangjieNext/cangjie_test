/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*

open class fatherclass{
    public init(a:Int64){}
}

class MySerializeDemo <: fatherclass & Serializable<MySerializeDemo> {
    public static var value01 : Int64 = 1

    public init(v1:Int64) {
        super({value01=v1;value01}())
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int64>("value01", value01))
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value01 = Int64.deserialize(d.get("value01"))
        MySerializeDemo(0)
    }
}

main(){}

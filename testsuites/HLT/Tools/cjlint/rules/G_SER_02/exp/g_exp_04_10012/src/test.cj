/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*

class a <: Serializable<a>{
    public var value01 : Int64 = 1
    public func serialize(){
        return DataModelStruct()
    }

    public static func deserialize(s: DataModel): a {
        let d = (s as DataModelStruct).getOrThrow()
        a()
    }
}

class MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value02 : a = a()

    public init(v1: Int64) {
        value02.value01 = v1
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<a>("value02", value02))
    }
    
    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value02 = a.deserialize(d.get("value02"))
        MySerializeDemo(1)
    }
}

main(){}

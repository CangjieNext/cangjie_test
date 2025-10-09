import stdx.serialization.serialization.*

class a <: Serializable<a>{
    public var b = 0
    public func serialize(){
        return DataModelStruct()
    }

    public static func deserialize(s: DataModel): a {
        let d = (s as DataModelStruct).getOrThrow()
        a()
    }
}

struct c <: Serializable<c>{
    public var b = 0
    public func serialize(){
        return DataModelStruct()
    }

    public static func deserialize(s: DataModel): c {
        let d = (s as DataModelStruct).getOrThrow()
        c()
    }
}

class MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value01 : a = a()
    public static var value02 : c = c()

    public init(v1: a) {
        value01 = if (v1.b >= 0 ) {
            v1
        } else {
            v1
        }
    }

    public init(v2: c) {
        value02 = if (v2.b >= 0 ) {
            v2
        } else {
            v2
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<a>("value01", value01)).add(field<c>("value02", value02))
    }
    
    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value01 = a.deserialize(d.get("value01"))
        value02 = c.deserialize(d.get("value02"))
        MySerializeDemo(a())
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

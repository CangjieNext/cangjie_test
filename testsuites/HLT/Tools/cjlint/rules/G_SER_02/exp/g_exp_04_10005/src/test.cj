import stdx.serialization.serialization.*

class MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value01 : Int64 = 1
    public static var value02 : Int32 = 1
    public static var value03 : Int16 = 1

    public init(v1:Int64,v2:Int32,v3:Int16) {
        try {
            value01 = v1
        } catch (_) {
            value02 = v2
        }finally{
            value03 = v3
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int64>("value01", value01)).add(field<Int32>("value02", value02)).add(field<Int16>("value03", value03))
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value01 = Int64.deserialize(d.get("value01"))
        value02 = Int32.deserialize(d.get("value02"))
        value03 = Int16.deserialize(d.get("value03"))
        MySerializeDemo(0,1,2)
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

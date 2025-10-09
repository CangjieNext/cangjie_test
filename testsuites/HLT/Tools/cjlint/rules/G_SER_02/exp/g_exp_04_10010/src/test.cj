import stdx.serialization.serialization.*
import std.sync.*

class MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value01 : Int64 = 1
    public static var value02 : Int32 = 1

    public init(v1:Int64,v2:Int32) {
        synchronized(ReentrantMutex()) {
            value01 = v1
            value02 = v2
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int64>("value01", value01)).add(field<Int32>("value02", value02))
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value01 = Int64.deserialize(d.get("value01"))
        value02 = Int32.deserialize(d.get("value02"))
        MySerializeDemo(0,1)
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

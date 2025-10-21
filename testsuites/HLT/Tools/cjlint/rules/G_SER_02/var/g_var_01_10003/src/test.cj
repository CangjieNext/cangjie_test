/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*

class MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value01 : Bool = true
    public static var value02 : Option<Int64> = Some(0)

    public static func a(){0}

    public init(v1: Bool,v2: Option<Int64>) {
        value01 = if (v1) {
            v1
        } else {
            false
        }

        var v = match(v2){
            case Some(x) => x
            case _ => -1
        }

        value02 = if (v >= 0) {
            v2
        } else {
            Some(0)
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Bool>("value01", value01)).add(field<Option<Int64>>("value02", value02))
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value01 = Bool.deserialize(d.get("value01"))
        value02 = Option<Int64>.deserialize(d.get("value02"))
        MySerializeDemo(true,Some(0))
    }
}

main(){}

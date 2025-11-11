/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*

class MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value01 : Option<Int64> = Some(0)
    public static var value02 : Bool = true
    public static var value03 : String = ""

    public init(v1: Option<Int64>,v2:Bool,v3:String) {
        value01 = match(v1){
            case Some(x) => Some(x*x)
            case _ => Some(0)
        }

        value02 = match{
            case v2==true => v2
            case _ => false
        }

        value03 = match(""){
            case "" => v3
            case _ => ""
        }

    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Option<Int64>>("value01", value01))
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        var v1 = Option<Int64>.deserialize(d.get("value01"))
        var v2 = Bool.deserialize(d.get("value02"))
        var v3 = String.deserialize(d.get("value03"))

        value01 = match(v1){
            case Some(x) => Some(x*x)
            case _ => Some(0)
        }

        value02 = match{
            case v2==true => v2
            case _ => false
        }

        value03 = match(""){
            case "" => v3
            case _ => ""
        }
        MySerializeDemo(Some(0),true,"")
    }
}

main(){}

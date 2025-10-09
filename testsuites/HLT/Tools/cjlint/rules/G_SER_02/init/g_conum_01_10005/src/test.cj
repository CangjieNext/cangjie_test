import stdx.serialization.serialization.*

class MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value01 : Int64 = 0
    public static var value02 : String = ""
    public static var value03 : Float64 = 0.0
    public static var value04 : Rune = 'a'
    public static var value05 : Float32 = 0.0

    public init(v: Int64) {
        value01 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public init(v: String) {
        value02 = if (v == "已检查") {
            v
        } else {
            "aaa"
        }
    }

    public init(v: Float64) {
        value03 = if (v >= 0.0) {
            v
        } else {
            0.0
        }
    }

    public init(v: Rune) {
        value04 = if (v == 'a') {
            v
        } else {
            'b'
        }
    }

    public init(v: Float32) {
        value05 = if (v >= 0.0) {
            v
        } else {
            0.0
        }
    }


    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int64>("value01", value01)).add(field<String>("value02", value02))
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value03 = Float64.deserialize(d.get("value03"))
        MySerializeDemo(4)
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

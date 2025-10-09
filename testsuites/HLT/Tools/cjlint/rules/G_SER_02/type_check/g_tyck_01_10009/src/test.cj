import stdx.serialization.serialization.*

open class MySerializeDemo03 <: Serializable<MySerializeDemo04>{
    public open func serialize(){
        return DataModelStruct()
    }

    public static func deserialize(s: DataModel): MySerializeDemo04 {
        let d = (s as DataModelStruct).getOrThrow()
        MySerializeDemo04(4)
    }
}

class MySerializeDemo04 <: MySerializeDemo03 {
    public static var value: Int64 = 0

    public init(v: Int64) {
        value = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public override func serialize(){
        return DataModelStruct()
    }

    public redef static func deserialize(s: DataModel): MySerializeDemo04 {
        let d = (s as DataModelStruct).getOrThrow()
        value = Int64.deserialize(d.get("value"))
        MySerializeDemo04(4)
    }
}

main(){
    MySerializeDemo04(1).serialize()
    return 0

}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

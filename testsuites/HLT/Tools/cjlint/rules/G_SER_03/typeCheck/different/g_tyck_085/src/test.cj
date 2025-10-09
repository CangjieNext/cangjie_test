import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}

class MySerialize <: Serializable<MySerialize> {
    public static var value: Array<Array<Rune>> = [[r'2', r'3']]

    public init(v: Array<Array<Rune>>) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Array<Array<Rune>>>("value", value))
    }

    private init(s: DataModelStruct) {
        var v = Array<Array<String>>.deserialize(s.get("value"))
    }

    public static func deserialize(s: DataModel): MySerialize {
        let d = (s as DataModelStruct).getOrThrow()
        return MySerialize(d)
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

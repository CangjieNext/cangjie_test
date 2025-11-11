/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*

class People <: Serializable<People> {
    var name: String

    // 口令是敏感数据
    var passwd: String

    init(s: DataModelStruct) {
        name = String.deserialize(s.get("name"))
        passwd = String.deserialize(s.get("passwd"))
    }

    public func serialize(): DataModel {
        DataModelStruct().add(field<String>("name", name))
        DataModelStruct().add(field<String>("passwd", passwd))
    }

    public static func deserialize(s: DataModel): People {
        let d = (s as DataModelStruct).getOrThrow()
        People(d)
    }
}
main(){}


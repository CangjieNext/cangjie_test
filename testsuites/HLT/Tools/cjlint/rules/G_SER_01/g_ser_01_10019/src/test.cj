/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*
import a.*

@M1
class People <: Serializable<People> {
    var name: String

    // 口令是敏感数据
    var password: String

    init(s: DataModelStruct) {
        name = String.deserialize(s.get("name"))
        password = String.deserialize(s.get("password"))
    }

    public func serialize(): DataModel {
        DataModelStruct().add(field<String>("name", name))
        DataModelStruct().add(field<String>("password", password))
    }

    public static func deserialize(s: DataModel): People {
        let d = (s as DataModelStruct).getOrThrow()
        People(d)
    }
}

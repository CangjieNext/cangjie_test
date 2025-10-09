// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import stdx.serialization.serialization.*

class People <: Serializable<People> {
    var name: String
    var password: String

    init(s: DataModelStruct) {
        name = String.deserialize(s.get("name"))
        password = String.deserialize(s.get("password"))
    }

    public func serialize(): DataModel {
		var fd = "password"
        fd.serialize()
        DataModelStruct().add(field<String>("name", name)).add(field<String>("password", password)).add(field<String>(fd, name))
    }

    public static func deserialize(s: DataModel): People {
        let d = (s as DataModelStruct).getOrThrow()
        People(d)
    }
}

class Persion {
    var name: String
    var password: String

    init(s: DataModelStruct) {
        name = String.deserialize(s.get("name"))
        password = String.deserialize(s.get("password"))
    }
}

extend Persion <: Serializable<Persion> {
    public func serialize(): DataModel {
        DataModelStruct().add(field<String>("name", name))
        DataModelStruct().add(field<String>("password", password))
    }

    public static func deserialize(s: DataModel): Persion {
        let d = (s as DataModelStruct).getOrThrow()
        Persion(d)
    }

}
main() {
	var str = "password"
	str.serialize()
	"password".serialize()
    var zhangsan = People(DataModelStruct())
}
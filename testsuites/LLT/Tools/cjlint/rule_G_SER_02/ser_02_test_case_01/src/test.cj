// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import stdx.serialization.serialization.*
internal import std.math.*
internal import stdx.encoding.json.*

class abc <: Serializable<abc>{
    static var name: String = "abcde"
    static var age: Int64 = 555
    static var loc: Option<Location> = Option<Location>.None

    private init()
    {
        name = "asdf"
        age = 123
        loc = Option<Location>.None
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<String>("name", name)).add(field<Int64>("age", age)).add(field<Option<Location>>("loc",loc))
    }

    public static func deserialize(dm: DataModel): abc {
        var dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var result = abc()
        //wrong
        name = String.deserialize(dms.get("name"))
        age = Int64.deserialize(dms.get("age"))
        loc = Option<Location>.deserialize(dms.get("loc"))
        return result
    }
}

class Location <: Serializable<Location>{
    static var time: Int64 = 666
    static var heheh: Rune = 'T'
    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int64>("time", time)).add(field<Rune>("heheh", heheh))
    }
    public static func deserialize(dm: DataModel): Location {
        var dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var result = Location()

        time = Int64.deserialize(dms.get("time"))
        heheh = Rune.deserialize(dms.get("heheh"))
        return result
    }
}

main() {
    return
}
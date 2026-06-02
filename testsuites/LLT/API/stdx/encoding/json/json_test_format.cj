/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: json_test_format.txt
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %n.%suffix %run_args > json_format.txt
// EXEC: %diff json_format.txt json_test_format.txt

import std.collection.*
import stdx.encoding.json.*
import stdx.serialization.serialization.*

main() {
    var m = Module()
    m.requires.add("aaa", RequiresModule())
    var jsonStr = m.serialize().toJson().toJsonString()
    println(jsonStr)
    0
}

public let ModuleFileName: String = "module.json"

public struct RequiresModule <: Serializable<RequiresModule> {
    public var organization: String = "a"
    public var version: String = "a"
    public var path: String = "a"

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(field<String>("organization", organization))
            .add(field<String>("version", version))
            .add(field<String>("path", path))
    }

    public static func deserialize(dm: DataModel): RequiresModule {
        var dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var result = RequiresModule()
        result.organization = String.deserialize(dms.get("organization"))
        result.version = String.deserialize(dms.get("version"))
        result.path = String.deserialize(dms.get("path"))
        return result
    }
}

public struct Module <: Serializable<Module> {
    public var organization: String = ""
    public var name: String = "b"
    public var description: String = "nothing here"
    public var version: String = "1.0.0"
    public var requires: HashMap<String, RequiresModule> = HashMap<String, RequiresModule>()
    public var packageRequires: HashMap<String, String> = HashMap<String, String>()
    public var arr: ArrayList<String> = ArrayList<String>(["this is arr[0]", "this is arr[1]", "this is arr[2]"])
    public var arr2: ArrayList<String> = ArrayList<String>()
    public init() {}
    public init(orgName: String, modName: String) {
        this.organization = orgName
        this.name = modName
    }

    public func serialize(): DataModel {
        return DataModelStruct()
            .add(field<String>("organization", organization))
            .add(field<String>("name", name))
            .add(field<String>("description", description))
            .add(field<String>("version", version))
            .add(field<HashMap<String, RequiresModule>>("requires", requires))
            .add(field<HashMap<String, String>>("packageRequires", packageRequires))
            .add(field<ArrayList<String>>("arr", arr))
            .add(field<ArrayList<String>>("arr2", arr2))
    }

    public static func deserialize(dm: DataModel): Module {
        var dms = match (dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        var result = Module()
        result.organization = String.deserialize(dms.get("organization"))
        result.name = String.deserialize(dms.get("name"))
        result.description = String.deserialize(dms.get("description"))
        result.version = String.deserialize(dms.get("version"))
        result.requires = HashMap<String, RequiresModule>.deserialize(dms.get("requires"))
        result.packageRequires = HashMap<String, String>.deserialize(dms.get("packageRequires"))
        result.arr = ArrayList<String>.deserialize(dms.get("arr"))
        result.arr2 = ArrayList<String>.deserialize(dms.get("arr2"))

        return result
    }
}

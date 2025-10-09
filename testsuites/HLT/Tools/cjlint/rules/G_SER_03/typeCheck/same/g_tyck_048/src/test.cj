import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}
import std.collection.HashMap

class MySerialize <: Serializable<MySerialize> {
    public static var value:HashMap<String,A> =HashMap<String,A>([("a",A(2)),("c",A(3))])
    public init(v: HashMap<String,A>) {
        value = v
    }
    public func serialize(): DataModel {
        return DataModelStruct().add(field<HashMap<String,A>>("value", value))
    }
    private init(s: DataModelStruct) {
        var v = HashMap<String,A>.deserialize(s.get("value"))
        value = v
    }
    public static func deserialize(s: DataModel): MySerialize {
        let d = (s as DataModelStruct).getOrThrow()
        return MySerialize(d)
    }
}

class A <: Serializable<A>{
    public var va : Int64=0
    public init(va:Int64) {
        this.va=va
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("va", va.serialize()))
        return dms
    }
    private init(dms: DataModelStruct) {
        this.va = Int64.deserialize(dms.get("va"))
    }
    public static func deserialize(dm: DataModel): A {
        let dms = (dm as DataModelStruct).getOrThrow()
        A(dms)
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

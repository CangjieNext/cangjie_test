import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}

class MySerialize <: Serializable<MySerialize> {
    public static var value:A =A(1)

    public init(v: A) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<A>("value", value))
    }

    private init(s: DataModelStruct) {
        var v = B.deserialize(s.get("value"))
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
class B <: Serializable<B>{
    public var vb : Int64=0
    public init(vb:Int64) {
        this.vb=vb
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("vb", vb.serialize()))
        return dms
    }
    private init(dms: DataModelStruct) {
        this.vb = Int64.deserialize(dms.get("vb"))
    }
    public static func deserialize(dm: DataModel): B {
        let dms = (dm as DataModelStruct).getOrThrow()
        B(dms)
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

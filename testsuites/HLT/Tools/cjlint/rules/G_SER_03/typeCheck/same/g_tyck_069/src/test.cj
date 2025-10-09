import stdx.serialization.serialization.{Serializable, DataModel, DataModelStruct, Field, field}


class MySerialize <: Serializable<MySerialize> {
    public static var value:HashSet<A> =HashSet<A>([A(2)])

    public init(v: HashSet<A>) {
        value = v
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<HashSet<A>>("value", value))
    }

    private init(s: DataModelStruct) {
        var v = HashSet<A>.deserialize(s.get("value"))
        value = v
    }

    public static func deserialize(s: DataModel): MySerialize {
        let d = (s as DataModelStruct).getOrThrow()
        return MySerialize(d)
    }
}

class A <: Serializable<A> & Hashable & Equatable<A>{
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
    public func hashCode() : Int64 {
        return 123
    }
    public operator func == (that: A) : Bool {
        if (this.va != that.va) {
            return false
        }
        return true
    }
    public operator func != (that: A) : Bool {
        if (this.va == that.va) {
            return false
        }
        return true
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

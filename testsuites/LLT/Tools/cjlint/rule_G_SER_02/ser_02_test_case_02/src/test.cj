// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import stdx.serialization.serialization.*

class MySerializeDemo01 <: Serializable<MySerializeDemo01> {
    var value01: Int64

    init(v: Int64) {
        value01 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    init(s: DataModelStruct) {
        value01 = Int64.deserialize(s.get("value01"))
    }

    public func serialize(): DataModel {
        return DataModelStruct()
    }

    public static func deserialize(s: DataModel): MySerializeDemo01 {
        let d = (s as DataModelStruct).getOrThrow()
        MySerializeDemo01(d)
    }
}

class MySerializeDemo02 <: Serializable<MySerializeDemo02> {
    var value02: Int64

    init(v: Int64) {
        value02 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    init(s: DataModelStruct) {
        var v = Int64.deserialize(s.get("value02"))
        value02 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct()
    }

    public static func deserialize(s: DataModel): MySerializeDemo02 {
        let d = (s as DataModelStruct).getOrThrow()
        MySerializeDemo02(d)
    }
}

class MySerializeDemo03 <: Serializable<MySerializeDemo03> {
    var value03: Int64

    init(v: Int64) {
        value03 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct()
    }

    public static func deserialize(s: DataModel): MySerializeDemo03 {
        var result = MySerializeDemo03(3)
        result.value03 = Int64.deserialize((s as DataModelStruct).getOrThrow().get("value03"))
        return result
    }
}

class MySerializeDemo04 <: Serializable<MySerializeDemo04> {
    static var value04: Int64 = 0

    init(v: Int64) {
        value04 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct()
    }

    // **WRONG**
    public static func deserialize(s: DataModel): MySerializeDemo04 {
        let d = (s as DataModelStruct).getOrThrow()
        value04 = Int64.deserialize(d.get("value04"))
        MySerializeDemo04(4)
    }
}

class MySerializeDemo05 <: Serializable<MySerializeDemo05> {
    static var value05: Int64 = 0

    init(v: Int64) {
        value05 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct()
    }

    public static func deserialize(s: DataModel): MySerializeDemo05 {
        processValue(s)
        MySerializeDemo05(5)
    }

    static private func processValue(s: DataModel) {
        let d = (s as DataModelStruct).getOrThrow()
        value05 = Int64.deserialize(d.get("value05"))
    }
}

class MySerializeDemo06 {
    static var value06: Int64 = 0

    init(v: Int64) {
        value06 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    func serialize(): DataModel {
        return DataModelStruct()
    }

    static func deserialize(s: DataModel): MySerializeDemo06 {
        let d = (s as DataModelStruct).getOrThrow()
        value06 = Int64.deserialize(d.get("value06"))
        MySerializeDemo06(6)
    }
}

class MySerializeDemo07 <: Serializable<MySerializeDemo07> {
    static var value07: Int64 = 0

    init() {}

    public func serialize(): DataModel {
        return DataModelStruct()
    }

    public static func deserialize(s: DataModel): MySerializeDemo07 {
        let d = (s as DataModelStruct).getOrThrow()
        value07 = Int64.deserialize(d.get("value07"))
        MySerializeDemo07()
    }
}

struct MySerializeDemo08 <: Serializable<MySerializeDemo08> {
    static var value08: Int64 = 0

    init(v: Int64) {
        value08 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct()
    }

    // **WRONG**
    public static func deserialize(s: DataModel): MySerializeDemo08 {
        let d = (s as DataModelStruct).getOrThrow()
        value08 = Int64.deserialize(d.get("value08"))
        MySerializeDemo08(8)
    }
}

open class MySerializeDemo09 <: Serializable<MySerializeDemo10> {
    public open func serialize() {
        return DataModelStruct()
    }

    public static func deserialize(s: DataModel): MySerializeDemo10 {
        let d = (s as DataModelStruct).getOrThrow()
        MySerializeDemo10(4)
    }
}

class MySerializeDemo10 <: MySerializeDemo09 {
    static var value10: Int64 = 0

    init(v: Int64) {
        value10 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public override func serialize() {
        return DataModelStruct()
    }

    // **WRONG**
    public static redef func deserialize(s: DataModel): MySerializeDemo10 {
        let d = (s as DataModelStruct).getOrThrow()
        value10 = Int64.deserialize(d.get("value10"))
        MySerializeDemo10(10)
    }
}

interface aaa <: Serializable<MySerializeDemo11> {}

interface bbb <: aaa {}

interface ccc <: bbb {}

struct MySerializeDemo11 <: ccc {
    static var value11: Int64 = 0

    init(v: Int64) {
        value11 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public func serialize() {
        return DataModelStruct()
    }

    // **WRONG**
    public static func deserialize(s: DataModel): MySerializeDemo11 {
        let d = (s as DataModelStruct).getOrThrow()
        value11 = Int64.deserialize(d.get("value11"))
        MySerializeDemo11(11)
    }
}

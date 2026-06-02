/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public import stdx.serialization.serialization.*
public import stdx.encoding.json.*

class A1N8D32 <: Serializable<A1N8D32> {
    public var Variable1: A2N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A2N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A2N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A1N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A1N8D32(dms)
    }
}

class A2N8D32 <: Serializable<A2N8D32> {
    public var Variable1: A3N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A3N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A3N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A2N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A2N8D32(dms)
    }
}

class A3N8D32 <: Serializable<A3N8D32> {
    public var Variable1: A4N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A4N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A4N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A3N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A3N8D32(dms)
    }
}

class A4N8D32 <: Serializable<A4N8D32> {
    public var Variable1: A5N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A5N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A5N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A4N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A4N8D32(dms)
    }
}

class A5N8D32 <: Serializable<A5N8D32> {
    public var Variable1: A6N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A6N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A6N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A5N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A5N8D32(dms)
    }
}

class A6N8D32 <: Serializable<A6N8D32> {
    public var Variable1: A7N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A7N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A7N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A6N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A6N8D32(dms)
    }
}

class A7N8D32 <: Serializable<A7N8D32> {
    public var Variable1: A8N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A8N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A8N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A7N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A7N8D32(dms)
    }
}

class A8N8D32 <: Serializable<A8N8D32> {
    public var Variable1: A9N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A9N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A9N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A8N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A8N8D32(dms)
    }
}

class A9N8D32 <: Serializable<A9N8D32> {
    public var Variable1: A10N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A10N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A10N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A9N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A9N8D32(dms)
    }
}

class A10N8D32 <: Serializable<A10N8D32> {
    public var Variable1: A11N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A11N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A11N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A10N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A10N8D32(dms)
    }
}

class A11N8D32 <: Serializable<A11N8D32> {
    public var Variable1: A12N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A12N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A12N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A11N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A11N8D32(dms)
    }
}

class A12N8D32 <: Serializable<A12N8D32> {
    public var Variable1: A13N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A13N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A13N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A12N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A12N8D32(dms)
    }
}

class A13N8D32 <: Serializable<A13N8D32> {
    public var Variable1: A14N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A14N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A14N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A13N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A13N8D32(dms)
    }
}

class A14N8D32 <: Serializable<A14N8D32> {
    public var Variable1: A15N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A15N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A15N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A14N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A14N8D32(dms)
    }
}

class A15N8D32 <: Serializable<A15N8D32> {
    public var Variable1: A16N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A16N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A16N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A15N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A15N8D32(dms)
    }
}

class A16N8D32 <: Serializable<A16N8D32> {
    public var Variable1: A17N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A17N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A17N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A16N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A16N8D32(dms)
    }
}

class A17N8D32 <: Serializable<A17N8D32> {
    public var Variable1: A18N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A18N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A18N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A17N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A17N8D32(dms)
    }
}

class A18N8D32 <: Serializable<A18N8D32> {
    public var Variable1: A19N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A19N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A19N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A18N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A18N8D32(dms)
    }
}

class A19N8D32 <: Serializable<A19N8D32> {
    public var Variable1: A20N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A20N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A20N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A19N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A19N8D32(dms)
    }
}

class A20N8D32 <: Serializable<A20N8D32> {
    public var Variable1: A21N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A21N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A21N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A20N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A20N8D32(dms)
    }
}

class A21N8D32 <: Serializable<A21N8D32> {
    public var Variable1: A22N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A22N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A22N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A21N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A21N8D32(dms)
    }
}

class A22N8D32 <: Serializable<A22N8D32> {
    public var Variable1: A23N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A23N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A23N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A22N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A22N8D32(dms)
    }
}

class A23N8D32 <: Serializable<A23N8D32> {
    public var Variable1: A24N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A24N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A24N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A23N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A23N8D32(dms)
    }
}

class A24N8D32 <: Serializable<A24N8D32> {
    public var Variable1: A25N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A25N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A25N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A24N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A24N8D32(dms)
    }
}

class A25N8D32 <: Serializable<A25N8D32> {
    public var Variable1: A26N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A26N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A26N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A25N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A25N8D32(dms)
    }
}

class A26N8D32 <: Serializable<A26N8D32> {
    public var Variable1: A27N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A27N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A27N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A26N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A26N8D32(dms)
    }
}

class A27N8D32 <: Serializable<A27N8D32> {
    public var Variable1: A28N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A28N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A28N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A27N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A27N8D32(dms)
    }
}

class A28N8D32 <: Serializable<A28N8D32> {
    public var Variable1: A29N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A29N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A29N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A28N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A28N8D32(dms)
    }
}

class A29N8D32 <: Serializable<A29N8D32> {
    public var Variable1: A30N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A30N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A30N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A29N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A29N8D32(dms)
    }
}

class A30N8D32 <: Serializable<A30N8D32> {
    public var Variable1: A31N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A31N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A31N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A30N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A30N8D32(dms)
    }
}

class A31N8D32 <: Serializable<A31N8D32> {
    public var Variable1: A32N8D32
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable1 = A32N8D32(Variable2, Variable3, Variable4, Variable5, Variable6, Variable7, Variable8, Variable9)
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable1 = A32N8D32.deserialize(dms.get("Variable1"))
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable1", Variable1.serialize()))
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A31N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A31N8D32(dms)
    }
}

class A32N8D32 <: Serializable<A32N8D32> {
    public var Variable2: Int64
    public var Variable3: Int64
    public var Variable4: Int64
    public var Variable5: Int64
    public var Variable6: Int64
    public var Variable7: Int64
    public var Variable8: Int64
    public var Variable9: Int64
    public init(Variable2: Int64, Variable3: Int64, Variable4: Int64, Variable5: Int64, Variable6: Int64,
        Variable7: Int64, Variable8: Int64, Variable9: Int64) {
        this.Variable2 = Variable2
        this.Variable3 = Variable3
        this.Variable4 = Variable4
        this.Variable5 = Variable5
        this.Variable6 = Variable6
        this.Variable7 = Variable7
        this.Variable8 = Variable8
        this.Variable9 = Variable9
    }
    private init(dms: DataModelStruct) {
        this.Variable2 = Int64.deserialize(dms.get("Variable2"))
        this.Variable3 = Int64.deserialize(dms.get("Variable3"))
        this.Variable4 = Int64.deserialize(dms.get("Variable4"))
        this.Variable5 = Int64.deserialize(dms.get("Variable5"))
        this.Variable6 = Int64.deserialize(dms.get("Variable6"))
        this.Variable7 = Int64.deserialize(dms.get("Variable7"))
        this.Variable8 = Int64.deserialize(dms.get("Variable8"))
        this.Variable9 = Int64.deserialize(dms.get("Variable9"))
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("Variable2", Variable2.serialize()))
        dms.add(Field("Variable3", Variable3.serialize()))
        dms.add(Field("Variable4", Variable4.serialize()))
        dms.add(Field("Variable5", Variable5.serialize()))
        dms.add(Field("Variable6", Variable6.serialize()))
        dms.add(Field("Variable7", Variable7.serialize()))
        dms.add(Field("Variable8", Variable8.serialize()))
        dms.add(Field("Variable9", Variable9.serialize()))
        return dms
    }
    public static func deserialize(dm: DataModel): A32N8D32 {
        let dms = (dm as DataModelStruct).getOrThrow()
        A32N8D32(dms)
    }
}

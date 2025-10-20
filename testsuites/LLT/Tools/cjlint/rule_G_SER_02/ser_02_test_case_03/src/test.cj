// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import stdx.serialization.serialization.*

open class MySerializeTestcaseSup648 <: Serializable<MySerializeTestcase648> {
    public open func serialize() {
        return DataModelStruct()
    }

    public static func deserialize(s: DataModel): MySerializeTestcase648 {
        let d = (s as DataModelStruct).getOrThrow()
        MySerializeTestcase648(648)
    }
}

class MySerializeTestcase648 <: MySerializeTestcaseSup648 {
    static var testcase648: Int64 = 0

    init(v: Int64) {
        testcase648 = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public override func serialize() {
        return DataModelStruct()
    }

    // **WRONG**
    public static redef func deserialize(s: DataModel): MySerializeTestcase648 {
        let d = (s as DataModelStruct).getOrThrow()
        testcase648 = Int64.deserialize(d.get("testcase648"))
        MySerializeTestcase648(648)
    }
}
class C {
    static var testcase648: Int64 = 0
    init(v: Int64) {
            testcase648 = if (v >= 0) {
                v
            } else {
                0
            }
    }
}

extend C <: Serializable<C> {
    public func serialize() {
            return DataModelStruct()
        }

        public static func deserialize(s: DataModel): C {
            let d = (s as DataModelStruct).getOrThrow()
            C(648)
        }
}

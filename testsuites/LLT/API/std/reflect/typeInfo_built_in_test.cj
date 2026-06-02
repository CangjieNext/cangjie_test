/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class TypeInfo
 *          Test whether TypeInfo is correctly provided for value types.
 * Test API:
 *      public static func of<T>(): TypeInfo
 *      public static func of(a: Any): TypeInfo
 *      public open prop name: String
 *      public open prop qualifiedName: String
 *      public operator func ==(that: TypeInfo): Bool
 *      public operator func !=(that: TypeInfo): Bool
 *      public func hashCode(): Int64
 *      public open func toString(): String
 */

import std.reflect.*

@Test
class ValueTypeInfoTest {
    @TestCase
    func intTest(): Unit {
        let int8Info = TypeInfo.of<Int8>()
        let int16Info = TypeInfo.of<Int16>()
        let int32Info = TypeInfo.of<Int32>()
        let int64Info = TypeInfo.of<Int64>()
        let intNativeInfo = TypeInfo.of<IntNative>()

        @Expect(int8Info.name, "Int8")
        @Expect(int16Info.name, "Int16")
        @Expect(int32Info.name, "Int32")
        @Expect(int64Info.name, "Int64")
        @Expect(intNativeInfo.name, "IntNative")

        @Expect(int8Info.qualifiedName, "Int8")
        @Expect(int16Info.qualifiedName, "Int16")
        @Expect(int32Info.qualifiedName, "Int32")
        @Expect(int64Info.qualifiedName, "Int64")
        @Expect(intNativeInfo.qualifiedName, "IntNative")

        let value: IntNative = 1
        @Expect(int8Info == TypeInfo.of(1i8))
        @Expect(int16Info == TypeInfo.of(1i16))
        @Expect(int32Info == TypeInfo.of(1i32))
        @Expect(int64Info == TypeInfo.of(1i64))
        @Expect(intNativeInfo == TypeInfo.of(value))

        @Expect(int8Info, TypeInfo.get("Int8"))
        @Expect(int16Info, TypeInfo.get("Int16"))
        @Expect(int32Info, TypeInfo.get("Int32"))
        @Expect(int64Info, TypeInfo.get("Int64"))
        @Expect(intNativeInfo, TypeInfo.get("IntNative"))

        @Expect(int8Info != int16Info)
        @Expect(int16Info != int32Info)
        @Expect(int32Info != int64Info)
        @Expect(int64Info != intNativeInfo)
        @Expect(intNativeInfo != int8Info)

        @Expect(int8Info.hashCode(), TypeInfo.get("Int8").hashCode())
        @Expect(int16Info.hashCode(), TypeInfo.get("Int16").hashCode())
        @Expect(int32Info.hashCode(), TypeInfo.get("Int32").hashCode())
        @Expect(int64Info.hashCode(), TypeInfo.get("Int64").hashCode())
        @Expect(intNativeInfo.hashCode(), TypeInfo.get("IntNative").hashCode())

        @Expect(int8Info.toString(), "Int8")
        @Expect(int16Info.toString(), "Int16")
        @Expect(int32Info.toString(), "Int32")
        @Expect(int64Info.toString(), "Int64")
        @Expect(intNativeInfo.toString(), "IntNative")
    }

    @TestCase
    func uintTest(): Unit {
        let uint8Info = TypeInfo.of<UInt8>()
        let uint16Info = TypeInfo.of<UInt16>()
        let uint32Info = TypeInfo.of<UInt32>()
        let uint64Info = TypeInfo.of<UInt64>()
        let uintNativeInfo = TypeInfo.of<UIntNative>()

        @Expect(uint8Info.name, "UInt8")
        @Expect(uint16Info.name, "UInt16")
        @Expect(uint32Info.name, "UInt32")
        @Expect(uint64Info.name, "UInt64")
        @Expect(uintNativeInfo.name, "UIntNative")

        @Expect(uint8Info.qualifiedName, "UInt8")
        @Expect(uint16Info.qualifiedName, "UInt16")
        @Expect(uint32Info.qualifiedName, "UInt32")
        @Expect(uint64Info.qualifiedName, "UInt64")
        @Expect(uintNativeInfo.qualifiedName, "UIntNative")

        let value: UIntNative = 1
        @Expect(uint8Info == TypeInfo.of(1u8))
        @Expect(uint16Info == TypeInfo.of(1u16))
        @Expect(uint32Info == TypeInfo.of(1u32))
        @Expect(uint64Info == TypeInfo.of(1u64))
        @Expect(uintNativeInfo == TypeInfo.of(value))

        @Expect(uint8Info, TypeInfo.get("UInt8"))
        @Expect(uint16Info, TypeInfo.get("UInt16"))
        @Expect(uint32Info, TypeInfo.get("UInt32"))
        @Expect(uint64Info, TypeInfo.get("UInt64"))
        @Expect(uintNativeInfo, TypeInfo.get("UIntNative"))

        @Expect(uint8Info != uint16Info)
        @Expect(uint16Info != uint32Info)
        @Expect(uint32Info != uint64Info)
        @Expect(uint64Info != uintNativeInfo)
        @Expect(uintNativeInfo != uint8Info)

        @Expect(uint8Info.hashCode(), TypeInfo.get("UInt8").hashCode())
        @Expect(uint16Info.hashCode(), TypeInfo.get("UInt16").hashCode())
        @Expect(uint32Info.hashCode(), TypeInfo.get("UInt32").hashCode())
        @Expect(uint64Info.hashCode(), TypeInfo.get("UInt64").hashCode())
        @Expect(uintNativeInfo.hashCode(), TypeInfo.get("UIntNative").hashCode())

        @Expect(uint8Info.toString(), "UInt8")
        @Expect(uint16Info.toString(), "UInt16")
        @Expect(uint32Info.toString(), "UInt32")
        @Expect(uint64Info.toString(), "UInt64")
        @Expect(uintNativeInfo.toString(), "UIntNative")
    }

    @TestCase
    func floatTest(): Unit {
        let float16Info = TypeInfo.of<Float16>()
        let float32Info = TypeInfo.of<Float32>()
        let float64Info = TypeInfo.of<Float64>()

        @Expect(float16Info.name, "Float16")
        @Expect(float32Info.name, "Float32")
        @Expect(float64Info.name, "Float64")

        @Expect(float16Info.qualifiedName, "Float16")
        @Expect(float32Info.qualifiedName, "Float32")
        @Expect(float64Info.qualifiedName, "Float64")

        @Expect(float16Info == TypeInfo.of(3.14f16))
        @Expect(float32Info == TypeInfo.of(3.14f32))
        @Expect(float64Info == TypeInfo.of(3.14f64))

        @Expect(float16Info, TypeInfo.get("Float16"))
        @Expect(float32Info, TypeInfo.get("Float32"))
        @Expect(float64Info, TypeInfo.get("Float64"))

        @Expect(float16Info != float32Info)
        @Expect(float32Info != float64Info)
        @Expect(float64Info != float16Info)

        @Expect(float16Info.hashCode(), TypeInfo.get("Float16").hashCode())
        @Expect(float32Info.hashCode(), TypeInfo.get("Float32").hashCode())
        @Expect(float64Info.hashCode(), TypeInfo.get("Float64").hashCode())

        @Expect(float16Info.toString(), "Float16")
        @Expect(float32Info.toString(), "Float32")
        @Expect(float64Info.toString(), "Float64")
    }

    @TestCase
    func boolTest(): Unit {
        let boolInfo = TypeInfo.of<Bool>()

        @Expect(boolInfo.name, "Bool")

        @Expect(boolInfo.qualifiedName, "Bool")

        @Expect(boolInfo == TypeInfo.of(true))
        @Expect(boolInfo == TypeInfo.of(false))

        @Expect(boolInfo, TypeInfo.get("Bool"))

        @Expect(boolInfo != TypeInfo.of(1))

        @Expect(boolInfo.hashCode(), TypeInfo.get("Bool").hashCode())

        @Expect(boolInfo.toString(), "Bool")
    }

    @TestCase
    func charTest(): Unit {
        let charInfo = TypeInfo.of<Rune>()

        @Expect(charInfo.name, "Rune")

        @Expect(charInfo.qualifiedName, "Rune")

        @Expect(charInfo == TypeInfo.of(r'a'))

        @Expect(charInfo, TypeInfo.get("Rune"))

        @Expect(charInfo != TypeInfo.of(1))

        @Expect(charInfo.hashCode(), TypeInfo.get("Rune").hashCode())

        @Expect(charInfo.toString(), "Rune")
    }

    @TestCase
    @Skip
    func unitTest(): Unit {
        let unitInfo = TypeInfo.of<Unit>()

        @Expect(unitInfo.name, "Unit")

        @Expect(unitInfo.qualifiedName, "Unit")

        @Expect(unitInfo == TypeInfo.of(println(1)))

        @Expect(unitInfo == TypeInfo.get("Unit"))

        @Expect(unitInfo != TypeInfo.of(1))

        @Expect(unitInfo.hashCode(), TypeInfo.get("Unit").hashCode())

        @Expect(unitInfo.toString(), "Unit")
    }

    @TestCase
    @Skip
    func nothingTest(): Unit {
        let nothingInfo = TypeInfo.of<Nothing>()

        @Expect(nothingInfo.name, "Nothing")

        @Expect(nothingInfo.qualifiedName, "Nothing")

        let nothingInfoCompare = TypeInfo.of<Nothing>()
        @Expect(nothingInfo == nothingInfoCompare)

        @Expect(nothingInfo == TypeInfo.get("Nothing"))

        @Expect(nothingInfo != TypeInfo.of(1))

        @Expect(nothingInfo.hashCode(), TypeInfo.get("Nothing").hashCode())

        @Expect(nothingInfo.toString(), "Nothing")
    }

    @TestCase
    @Skip
    func tupleTest(): Unit {
        let tupleInt = TypeInfo.of<(Int64, Int64)>()

        @Expect(tupleInt.name, "(Int64, Int64)")

        @Expect(tupleInt.qualifiedName, "(Int64, Int64)")

        let a: (Int64, Int64) = (1, 2)
        @Expect(tupleInt == TypeInfo.of(a))

        let b: (Int64, Int8) = (1, 2i8)
        @Expect(tupleInt != TypeInfo.of(b))

        @Expect(tupleInt.hashCode(), TypeInfo.of(a).hashCode())

        @Expect(tupleInt.toString(), "(Int64, Int64)")
    }
}

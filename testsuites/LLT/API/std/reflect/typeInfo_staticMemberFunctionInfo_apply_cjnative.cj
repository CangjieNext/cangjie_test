/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class TypeInfo
 *          Test whether func StaticFunctionInfo apply is correct.
 * Test API:
 *      public func apply(args: Array<Any>): Bool
 */

import std.reflect.*

@Test
class TypeInfoInstanceFunction {
    @TestCase
    func testApply(): Unit {
        let a = A()
        let objType = TypeInfo.of(a)

        let funcReturnBool = objType.getStaticFunction("funcReturnBool", [])
        let funcReturnUInt8 = objType.getStaticFunction("funcReturnUInt8", [])
        let funcReturnInt8 = objType.getStaticFunction("funcReturnInt8", [])
        let funcReturnInt16 = objType.getStaticFunction("funcReturnInt16", [])
        let funcReturnUInt16 = objType.getStaticFunction("funcReturnUInt16", [])
        let funcReturnInt32 = objType.getStaticFunction("funcReturnInt32", [])
        let funcReturnUInt32 = objType.getStaticFunction("funcReturnUInt32", [])
        let funcReturnInt64 = objType.getStaticFunction("funcReturnInt64", [])
        let funcReturnUInt64 = objType.getStaticFunction("funcReturnUInt64", [])
        let funcReturnRune = objType.getStaticFunction("funcReturnRune", [])
        let funcReturnIntNative = objType.getStaticFunction("funcReturnIntNative", [])
        let funcReturnUIntNative = objType.getStaticFunction("funcReturnUIntNative", [])
        let funcReturnFloat16 = objType.getStaticFunction("funcReturnFloat16", [])
        let funcReturnFloat32 = objType.getStaticFunction("funcReturnFloat32", [])
        let funcReturnFloat64 = objType.getStaticFunction("funcReturnFloat64", [])
        try {
            funcReturnBool.apply(TypeInfo.of<String>(), [])
            @Assert(false)
        } catch (e: IllegalArgumentException) {
        }

        @Expect((funcReturnBool.apply(objType, []) as Bool).getOrThrow(), false)
        @Expect((funcReturnUInt8.apply(objType, []) as UInt8).getOrThrow(), 1)
        @Expect((funcReturnInt8.apply(objType, []) as Int8).getOrThrow(), 1)
        @Expect((funcReturnInt16.apply(objType, []) as Int16).getOrThrow(), 1)
        @Expect((funcReturnUInt16.apply(objType, []) as UInt16).getOrThrow(), 1)
        @Expect((funcReturnInt32.apply(objType, []) as Int32).getOrThrow(), 1)
        @Expect((funcReturnUInt32.apply(objType, []) as UInt32).getOrThrow(), 1)
        @Expect((funcReturnInt64.apply(objType, []) as Int64).getOrThrow(), 1)
        @Expect((funcReturnUInt64.apply(objType, []) as UInt64).getOrThrow(), 1)
        @Expect((funcReturnRune.apply(objType, []) as Rune).getOrThrow(), r'a')
        @Expect((funcReturnIntNative.apply(objType, []) as IntNative).getOrThrow(), 1)
        @Expect((funcReturnUIntNative.apply(objType, []) as UIntNative).getOrThrow(), 1)
        @Expect((funcReturnFloat16.apply(objType, []) as Float16).getOrThrow(), 1.1)
        @Expect((funcReturnFloat32.apply(objType, []) as Float32).getOrThrow(), 1.1)
        @Expect((funcReturnFloat64.apply(objType, []) as Float64).getOrThrow(), 1.1)

        let funcMultiInt64Parameter = objType.getStaticFunction(
            "funcMultiInt64Parameter",
            TypeInfo.of<Int64>(),
            TypeInfo.of<Int64>(),
            TypeInfo.of<Int64>(),
            TypeInfo.of<Int64>(),
            TypeInfo.of<Int64>(),
            TypeInfo.of<Int64>(),
            TypeInfo.of<Int64>(),
            TypeInfo.of<Int64>(),
            TypeInfo.of<Int64>(),
            TypeInfo.of<Int64>()
        )
        @Expect((funcMultiInt64Parameter.apply(objType, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10) as Int64).getOrThrow(), 55)

        let funcMultiFloat64Parameter = objType.getStaticFunction(
            "funcMultiFloat64Parameter",
            TypeInfo.of<Float64>(),
            TypeInfo.of<Float64>(),
            TypeInfo.of<Float64>(),
            TypeInfo.of<Float64>(),
            TypeInfo.of<Float64>(),
            TypeInfo.of<Float64>(),
            TypeInfo.of<Float64>(),
            TypeInfo.of<Float64>(),
            TypeInfo.of<Float64>(),
            TypeInfo.of<Float64>()
        )
        @Expect((funcMultiFloat64Parameter.apply(objType, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9, 10.1) as Float64).getOrThrow(), 59.6)
    }
}
/**************************************************************************/
public class A {
    public static func funcReturnBool(): Bool {
        var ret: Bool = false
        return ret
    }
    public static func funcReturnUInt8(): UInt8 {
        var ret: UInt8 = 1
        return ret
    }
    public static func funcReturnInt8(): Int8 {
        var ret: Int8 = 1
        return ret
    }
    public static func funcReturnInt16(): Int16 {
        var ret: Int16 = 1
        return ret
    }
    public static func funcReturnUInt16(): UInt16 {
        var ret: UInt16 = 1
        return ret
    }
    public static func funcReturnInt32(): Int32 {
        var ret: Int32 = 1
        return ret
    }
    public static func funcReturnUInt32(): UInt32 {
        var ret: UInt32 = 1
        return ret
    }
    public static func funcReturnInt64(): Int64 {
        var ret: Int64 = 1
        return ret
    }
    public static func funcReturnUInt64(): UInt64 {
        var ret: UInt64 = 1
        return ret
    }
    public static func funcReturnRune(): Rune {
        var ret: Rune = r'a'
        return ret
    }
    public static func funcReturnIntNative(): IntNative {
        var ret: IntNative = 1
        return ret
    }
    public static func funcReturnUIntNative(): UIntNative {
        var ret: UIntNative = 1
        return ret
    }
    public static func funcReturnFloat16(): Float16 {
        var ret: Float16 = 1.1
        return ret
    }
    public static func funcReturnFloat32(): Float32 {
        var ret: Float32 = 1.1
        return ret
    }
    public static func funcReturnFloat64(): Float64 {
        var ret: Float64 = 1.1
        return ret
    }
    public static func funcMultiInt64Parameter(a1: Int64, a2: Int64, a3: Int64, a4: Int64, a5: Int64, a6: Int64,
        a7: Int64, a8: Int64, a9: Int64, a10: Int64): Int64 {
        var ret: Int64 = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10
        return ret
    }

    public static func funcMultiFloat64Parameter(a1: Float64, a2: Float64, a3: Float64, a4: Float64, a5: Float64,
        a6: Float64, a7: Float64, a8: Float64, a9: Float64, a10: Float64): Float64 {
        var ret: Float64 = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10
        return ret
    }
}

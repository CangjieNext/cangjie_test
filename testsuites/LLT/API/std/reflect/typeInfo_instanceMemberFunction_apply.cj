/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not CJNATIVE) EXEC: %compiler %cmp_opt -g %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class TypeInfo
 *          Test whether func InstanceFunction apply is correct.
 * Test API:
 *      public func apply(args: Array<Any>): Bool
 */

import std.reflect.*
import std.collection.*

@Test
class TypeInfoInstanceFunction {
    @TestCase
    func testApply(): Unit {
        let a = A()
        let objType = TypeInfo.of(a)

        let funcReturnBool = objType.getInstanceFunction("funcReturnBool", [])
        let funcReturnUInt8 = objType.getInstanceFunction("funcReturnUInt8", [])
        let funcReturnInt8 = objType.getInstanceFunction("funcReturnInt8", [])
        let funcReturnInt16 = objType.getInstanceFunction("funcReturnInt16", [])
        let funcReturnUInt16 = objType.getInstanceFunction("funcReturnUInt16", [])
        let funcReturnInt32 = objType.getInstanceFunction("funcReturnInt32", [])
        let funcReturnUInt32 = objType.getInstanceFunction("funcReturnUInt32", [])
        let funcReturnInt64 = objType.getInstanceFunction("funcReturnInt64", [])
        let funcReturnUInt64 = objType.getInstanceFunction("funcReturnUInt64", [])
        let funcReturnRune = objType.getInstanceFunction("funcReturnRune", [])
        let funcReturnIntNative = objType.getInstanceFunction("funcReturnIntNative", [])
        let funcReturnUIntNative = objType.getInstanceFunction("funcReturnUIntNative", [])
        let funcReturnFloat16 = objType.getInstanceFunction("funcReturnFloat16", [])
        let funcReturnFloat32 = objType.getInstanceFunction("funcReturnFloat32", [])
        let funcReturnFloat64 = objType.getInstanceFunction("funcReturnFloat64", [])

        @Expect((funcReturnBool.apply(a) as Bool).getOrThrow(), false)
        @Expect((funcReturnUInt8.apply(a) as UInt8).getOrThrow(), 1)
        @Expect((funcReturnInt8.apply(a) as Int8).getOrThrow(), 1)
        @Expect((funcReturnInt16.apply(a) as Int16).getOrThrow(), 1)
        @Expect((funcReturnUInt16.apply(a) as UInt16).getOrThrow(), 1)
        @Expect((funcReturnInt32.apply(a) as Int32).getOrThrow(), 1)
        @Expect((funcReturnUInt32.apply(a) as UInt32).getOrThrow(), 1)
        @Expect((funcReturnInt64.apply(a) as Int64).getOrThrow(), 1)
        @Expect((funcReturnUInt64.apply(a) as UInt64).getOrThrow(), 1)
        @Expect((funcReturnRune.apply(a) as Rune).getOrThrow(), r'a')
        @Expect((funcReturnIntNative.apply(a) as IntNative).getOrThrow(), 1)
        @Expect((funcReturnUIntNative.apply(a) as UIntNative).getOrThrow(), 1)
        @Expect((funcReturnFloat16.apply(a) as Float16).getOrThrow(), 1.1)
        @Expect((funcReturnFloat32.apply(a) as Float32).getOrThrow(), 1.1)
        @Expect((funcReturnFloat64.apply(a) as Float64).getOrThrow(), 1.1)

        let funcMultiInt64Parameter = objType.getInstanceFunction(
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
        @Expect((funcMultiInt64Parameter.apply(a, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10) as Int64).getOrThrow(), 55)

        let funcMultiParameter = objType.getInstanceFunction(
            "funcMultiParameter",
            TypeInfo.of<UInt8>(),
            TypeInfo.of<Int8>(),
            TypeInfo.of<Rune>(),
            TypeInfo.of<Float16>(),
            TypeInfo.of<Float32>(),
            TypeInfo.of<Float64>(),
            TypeInfo.of<Int16>(),
            TypeInfo.of<UInt16>(),
            TypeInfo.of<Int32>(),
            TypeInfo.of<UInt32>()
        )
        let a1: UInt8 = 1
        let a2: Int8 = 2
        let a3: Rune = r'3'
        let a4: Float16 = 4.0
        let a5: Float32 = 5.0
        let a6: Float64 = 6.0
        let a7: Int16 = 7
        let a8: UInt16 = 8
        let a9: Int32 = 9
        let a10: UInt32 = 10
        @Expect((funcMultiParameter.apply(a, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10) as Bool).getOrThrow(), true)
    }

    @TestCase
    @Skip
    func testApplyArray() {
        let a = A()
        let objType = TypeInfo.of(a)
        let funcArrayParameter = objType.getInstanceFunction("funcArrayParameter", TypeInfo.of<Array<String>>())
        let parm: Array<String> = ["one", "two"]
        let res = (funcArrayParameter.apply(a, parm) as Array<String>).getOrThrow()
        @Expect(res[0] == "one" && res[1] == "two")
    }

    @TestCase
    func testOperator() {
        let tObj = Test<Int64, Person>()
        tObj.add(0, Person("tony"))
        let ti = TypeInfo.of(tObj)
        let f = ti.getInstanceFunction("[]", [TypeInfo.get("Int64")])
        var person = (f.apply(tObj, [0]) as Person).getOrThrow()
        @Expect(person.getPersonName() == "tony")
    }
}
/**************************************************************************/
public class A {
    public func funcReturnBool(): Bool {
        var ret: Bool = false
        return ret
    }
    public func funcReturnUInt8(): UInt8 {
        var ret: UInt8 = 1
        return ret
    }
    public func funcReturnInt8(): Int8 {
        var ret: Int8 = 1
        return ret
    }
    public func funcReturnInt16(): Int16 {
        var ret: Int16 = 1
        return ret
    }
    public func funcReturnUInt16(): UInt16 {
        var ret: UInt16 = 1
        return ret
    }
    public func funcReturnInt32(): Int32 {
        var ret: Int32 = 1
        return ret
    }
    public func funcReturnUInt32(): UInt32 {
        var ret: UInt32 = 1
        return ret
    }
    public func funcReturnInt64(): Int64 {
        var ret: Int64 = 1
        return ret
    }
    public func funcReturnUInt64(): UInt64 {
        var ret: UInt64 = 1
        return ret
    }
    public func funcReturnRune(): Rune {
        var ret: Rune = r'a'
        return ret
    }
    public func funcReturnIntNative(): IntNative {
        var ret: IntNative = 1
        return ret
    }
    public func funcReturnUIntNative(): UIntNative {
        var ret: UIntNative = 1
        return ret
    }
    public func funcReturnFloat16(): Float16 {
        var ret: Float16 = 1.1
        return ret
    }
    public func funcReturnFloat32(): Float32 {
        var ret: Float32 = 1.1
        return ret
    }
    public func funcReturnFloat64(): Float64 {
        var ret: Float64 = 1.1
        return ret
    }
    public func funcMultiInt64Parameter(a1: Int64, a2: Int64, a3: Int64, a4: Int64, a5: Int64, a6: Int64, a7: Int64,
        a8: Int64, a9: Int64, a10: Int64): Int64 {
        var ret: Int64 = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10
        return ret
    }

    public func funcMultiParameter(a1: UInt8, a2: Int8, a3: Rune, a4: Float16, a5: Float32, a6: Float64, a7: Int16,
        a8: UInt16, a9: Int32, a10: UInt32): Bool {
        if (a1 != 1) {
            return false
        }
        if (a2 != 2) {
            return false
        }
        if (a3 != r'3') {
            return false
        }
        if (a4 != 4.0) {
            return false
        }
        if (a5 != 5.0) {
            return false
        }
        if (a6 != 6.0) {
            return false
        }
        if (a7 != 7) {
            return false
        }
        if (a8 != 8) {
            return false
        }
        if (a9 != 9) {
            return false
        }
        if (a10 != 10) {
            return false
        }
        return true
    }

    public func funcArrayParameter(arr: Array<String>): Array<String> {
        return arr
    }
}

class Person {
    public var name: String
    public func getPersonName(): String {
        name
    }
    init(str: String) {
        name = str
    }
}

class Test<K, V> where K <: Hashable & Equatable<K> {
    public operator func [](k: K): V {
        data[k]
    }
    public func add(k: K, v: V) {
        data.add(k, v)
    }
    public init() {
        data = HashMap()
    }

    private var data: HashMap<K, V>
}

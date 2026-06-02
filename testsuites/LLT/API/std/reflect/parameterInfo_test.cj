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
 *      Test class ParameterInfo
 *          Test whether ParameterInfo is correct.
 * Test API:
 *      public prop index: Int64
 *      public prop typeInfo: TypeInfo
 *      public func toString(): String
 */

import std.reflect.*
import std.collection.ArrayList

@Test
class parmInfoTest {
    @TestCase
    func parmInfoApiTest(): Unit {
        let classInfo = A() |> TypeInfo.of
        let intInfo = TypeInfo.of<Int64>()

        let funciInfo = classInfo.getInstanceFunction("fi", TypeInfo.of<Int64>(), TypeInfo.of<Int32>(),
            TypeInfo.of<Int16>(), TypeInfo.of<Int8>())
        let iparmInfoList = funciInfo.parameters.toArray()
        indexTest(iparmInfoList)
        @Expect(iparmInfoList.size, 4)
        @Expect(contains(iparmInfoList, TypeInfo.of<Int64>()))
        @Expect(contains(iparmInfoList, TypeInfo.of<Int32>()))
        @Expect(contains(iparmInfoList, TypeInfo.of<Int16>()))
        @Expect(contains(iparmInfoList, TypeInfo.of<Int8>()))

        let funcbInfo = classInfo.getInstanceFunction("fb", TypeInfo.of<Bool>())
        let bparmInfoList = funcbInfo.parameters.toArray()
        indexTest(bparmInfoList)
        @Expect(bparmInfoList.size, 1)
        @Expect(contains(bparmInfoList, TypeInfo.of<Bool>()))


        let funcoInfo = classInfo.getInstanceFunction("fo", ClassTypeInfo.of<B>())
        let oparmInfoList = funcoInfo.parameters.toArray()
        indexTest(oparmInfoList)
        @Expect(oparmInfoList.size, 1)
        @Expect(contains(oparmInfoList, TypeInfo.of<B>()))

        let funcinInfo = classInfo.getInstanceFunction("fin", InterfaceTypeInfo.of<C>())
        let inparmInfoList = funcinInfo.parameters.toArray()
        indexTest(inparmInfoList)
        @Expect(inparmInfoList.size, 1)
        @Expect(contains(inparmInfoList, TypeInfo.of<C>()))
    }

    func indexTest(arr: Array<ParameterInfo>) {
        for (i in 0..arr.size) {
            @Expect(arr[i].index, i)
        }
    }
}

public class A {
    public func fi(v1: Int64, v2: Int32, v3: Int16, v4: Int8) {}

    public func fui(v1: UInt64, v2: UInt32, v3: UInt16, v4: UInt8) {}

    public func ff(v1: Float64, v2: Float32, v3: Float16) {}

    public func fb(v: Bool) {}

    public func fc(v: Rune) {}

    public func fo(v: B) {}

    public func fin(v: C) {}

    public func fs(v: D) {}
}

public class B {}

public interface C {
    func f(v: Int64): Unit
}

public struct D {
    let a = 1
    let b = 2
}

public func contains(param: Array<ParameterInfo>, element: TypeInfo): Bool {
    if (param.size == 0) {
        return false
    }
    for (i in param) {
        if (i.typeInfo == element) {
            return true
        }
    }
    return false
}

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
 *      Test class ParameterInfo
 *          Test whether ParameterInfo is correct.
 * Test API:
 *      public prop index: Int64
 *      public prop name: TypeInfo
 */

import std.reflect.*
import std.collection.ArrayList

@Test
class parmInfoTest {
    @TestCase
    func parmInfoApiTest(): Unit {
        let f = (TypeInfo.of<Foo>() as ClassTypeInfo).getOrThrow()
        let func1Info = f.getInstanceFunction("func1", TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(),
            TypeInfo.of<Int8>())
        let func1Paramters = func1Info.parameters
        for (param in func1Paramters) {
            @Expect(param.name, "p" + param.index.toString())
        }

        let func2Info = f.getInstanceFunction("func2", TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(),
            TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>())
        let func2Paramters = func2Info.parameters
        for (param in func2Paramters) {
            @Expect(param.name, "p" + param.index.toString())
        }

        let func3Info = f.getInstanceFunction("func3", TypeInfo.of<Float64>(), TypeInfo.of<Float32>(),
            TypeInfo.of<Float16>())
        let func3Paramters = func3Info.parameters
        for (param in func3Paramters) {
            @Expect(param.name, "p" + param.index.toString())
        }

        let func4Info = f.getInstanceFunction("func4", TypeInfo.of<Bar>())
        let func4Paramters = func4Info.parameters
        for (param in func4Paramters) {
            @Expect(param.name, "p" + param.index.toString())
        }
    }
}

public class Foo {
    public func func1(p0: Int64, p1: Int32, p2: Int16, p3: Int8) {}

    public func func2(p0: UInt64, p1: UInt32, p2: UInt16, p3: UInt8) {}

    public func func3(p0: Float64, p1: Float32, p2: Float16) {}

    public func func4(p0: Bar) {}
}

public struct Bar {}

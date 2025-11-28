/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler -Woff all %cmp_opt %f -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.reflect.*
import std.unittest.*
import std.unittest.testmacro.*

func fn0(): Int64 {
    42
}

func fn2(a: Int64, b: String): Bool {
    a > 0 && b.size > 0
}

@Test
class FunctionTypeInfoTest {
    @TestCase
    func testOfInstance() {
        let f0: () -> Int64 = fn0
        let info0 = FunctionTypeInfo.of(f0)
        @Expect(info0.parameters.size, 0)
        @Expect(info0.returnType.name, "Int64")

        let f2: (Int64, String) -> Bool = fn2
        let info2 = FunctionTypeInfo.of(f2)
        @Expect(info2.parameters.size, 2)
        @Expect(info2.parameters[0].name, "Int64")
        @Expect(info2.parameters[1].name, "String")
        @Expect(info2.returnType.name, "Bool")
    }

    @TestCase
    func testOfType() {
        let info = FunctionTypeInfo.of<(Int64, String) -> Bool>()
        @Expect(info.parameters.size, 2)
        @Expect(info.parameters[0].name, "Int64")
        @Expect(info.parameters[1].name, "String")
        @Expect(info.returnType.name, "Bool")
    }
}

@Test
class FunctionTypeInfoNegativeTest {
    @TestCase
    func testOfNonFunctionType() {
        var e = @ExpectThrows[IllegalTypeException](FunctionTypeInfo.of(1)).getOrThrow()
        @Expect(e.message.contains("is not a function type"))
        e = @ExpectThrows[IllegalTypeException](FunctionTypeInfo.of<Int64>()).getOrThrow()
        @Expect(e.message.contains("is not a function type"))
    }

    @TestCase
    func testApplyWithInvalidArgsCount() {
        let f2: (Int64, String) -> Bool = fn2
        let info = FunctionTypeInfo.of(f2)
        let e = @ExpectThrows[IllegalArgumentException](info.apply(f2, [1])).getOrThrow()
        @Expect(e.message.contains("does not match"))
    }
}


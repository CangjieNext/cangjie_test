/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (not MAC) EXEC: cd ./MyType && %compiler %cmp_opt --output-type=dylib --module-name=MyType ./src/myType/*.cj -o libMyType_myType.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f --import-path . -L ./MyType -lMyType_myType %cmp_utest_opt
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args
import std.reflect.*
import MyType.myType.*

@Test
class Test {
    @TestCase
    func testInterface(): Unit {
        @Expect(TypeInfo.get("MyType.myType.I0").toString(), "MyType.myType.I0")
        @Expect(TypeInfo.get("MyType.myType.I1").toString(), "MyType.myType.I1")
        @Expect(TypeInfo.get("MyType.myType.I2").toString(), "MyType.myType.I2")
        @Expect(TypeInfo.get("MyType.myType.I3").toString(), "MyType.myType.I3")
        @Expect(TypeInfo.get("MyType.myType.I4").toString(), "MyType.myType.I4")
        @Expect(TypeInfo.get("MyType.myType.I5").toString(), "MyType.myType.I5")
        @Expect(TypeInfo.get("MyType.myType.I6").toString(), "MyType.myType.I6")
    }
}

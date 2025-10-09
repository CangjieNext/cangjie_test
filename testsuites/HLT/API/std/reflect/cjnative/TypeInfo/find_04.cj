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
    func testMalformedQualifiedNameException(): Unit {
        // 限定名称格式错误。
        // 注意，cjnative并不关心限定名称格式错误，而统一直接抛出未找到异常。cjvm则会关心格式错误。
        try {
            TypeInfo.get("MyType.myType.");
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "InfoNotFoundException: TypeInfo 'MyType.myType.' not found.")
        }

        try {
            TypeInfo.get(",defau.");
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "InfoNotFoundException: TypeInfo ',defau.' not found.")
        }
    }
}

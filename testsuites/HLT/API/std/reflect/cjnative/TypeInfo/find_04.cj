/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o libMyType.myType.%library_suffix
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt -o %output %f -L. -lMyType.myType %cmp_utest_opt
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
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

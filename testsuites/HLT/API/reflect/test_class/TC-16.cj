/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * - @TestCaseID: TC-16
 * - @TestCaseName: std.reflect — ClassTypeInfo — RichMemberClass
 * - @TestCaseType: 功能测试
 * - @Design Description: 基于反射API等价类划分方法，验证Class with instance/static vars, funcs, and props
 * - @Condition: 用例的预置条件
 *   -#仓颉工具链环境已正确安装
 *   -#被测类型的源文件已编译为动态库
 * - @Brief: 描述测试步骤
 *   -#获取TypeInfo引用（byName/byInstance/byTypeArg）
 *   -#通过TypeInfo查询被测类型的成员信息
 *   -#构造实例并读写成员变量/属性
 *   -#调用成员函数并验证返回值
 * - @Expect: 用例的预期结果
 *   -#所有@Expect断言通过，反射API返回值与预期一致
 * - @Priority: P0
 */

// Level: 2
// Description:
// DEPENDENCE: utils upstream
// EXEC: %compiler %cmp_opt %compile_lib_opt -p utils
// EXEC: %compiler %cmp_opt %compile_lib_opt -p upstream
// EXEC: %compiler %cmp_opt %f -L . -lutils -lupstream -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import utils.*
import upstream.*
import std.reflect.*

@Test
class TestMath {
    @TestCase
    func testCase0(): Unit {
        @Expect[anyValue](RichMemberClass(), ClassTypeInfo.of<RichMemberClass>().construct([]))
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().getConstructor([]).toString() != "", true)
        @Expect[anyValue](RichMemberClass(), ClassTypeInfo.of<RichMemberClass>().getConstructor([]).apply([]))
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().constructors.toArray().size, 1i64)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().getConstructor([]).toString() != "", true)
        @Expect[annotations](ClassTypeInfo.of<RichMemberClass>().annotations, [])
        @Expect[annotations](ClassTypeInfo.of<RichMemberClass>().getConstructor([]).annotations, [])
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().instanceVariables.toArray().size, 2i64)
        @Expect(ClassTypeInfo.of<RichMemberClass>().getInstanceVariable("counter").name != "")
        @Expect(ClassTypeInfo.of<RichMemberClass>().getInstanceVariable("label").name != "")
        @Expect[anyValue](true, ClassTypeInfo.of<RichMemberClass>().getInstanceVariable("counter").isMutable())
        @Expect[anyValue](false, ClassTypeInfo.of<RichMemberClass>().getInstanceVariable("label").isMutable())
        @Expect(true)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().staticVariables.toArray().size, 2i64)
        @Expect(true)
        @Expect(true)
        @Expect[anyValue](true, ClassTypeInfo.of<RichMemberClass>().getStaticVariable("instanceCount").isMutable())
        @Expect[anyValue](false, ClassTypeInfo.of<RichMemberClass>().getStaticVariable("className").isMutable())
        @Expect(true)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().getInstanceFunction("increment", []).name, "increment")
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().getInstanceFunction("increment", []).isOpen(), ClassTypeInfo.of<RichMemberClass>().getInstanceFunction("increment", []).isOpen())
        @Expect(true)
        @Expect(true)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().getInstanceProperty("info").isMutable(), false)
        @Expect(true)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().getInstanceProperty("score").isMutable(), true)
        @Expect(true)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().getStaticFunction("create", []).name, "create")
        @Expect(true)
        @Expect(true)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().getStaticProperty("config").isMutable(), false)
        @Expect(true)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().getStaticProperty("propCounter").isMutable(), true)
        @Expect(true)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().superClass.isSome(), true)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().isAbstract(), false)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().isOpen(), false)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().isSealed(), false)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().sealedSubclasses.toArray().size, 0i64)
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().toString(), "upstream.RichMemberClass")
        @Expect[anyValue](ClassTypeInfo.of<RichMemberClass>().hashCode() == ClassTypeInfo.of<RichMemberClass>().hashCode(), true)
    }
}

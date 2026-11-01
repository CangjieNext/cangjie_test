/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-INV-0
 * @TestCaseName: stdx.aspect_cj — invalid: foreign_func
 * @TestCaseType: 负面测试
 * @Design Description: 被注解函数为 public foreign 函数——语言层即报修饰符冲突，cjc 语义分析先于编译插件（语言错误在场时插件检查全部不运行）
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Brief: 1. 构造违规：被注解函数为 public foreign 函数——语言层即报修饰符冲突，cjc 语义分析先于编译插件（语言错误在场时插件检查全部不运行）
 * @Brief: 2. collect 阶段编译失败，断言报错锚
 * @Expect: 编译报错含「modifiers conflict on function declaration」
 */
// LEVEL: 2
// EXEC-PIPE-1: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix 2>&1 | compare %f
// ASSERT: scan modifiers conflict on function declaration
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspect_cj.*

@InsertAtEntry[packageName: "AOP_demo1", className: "", methodName: "wovenFunction", isStatic: false, recursive: false, funcTypeStr: "()->Unit"]
public foreign func annotatedFunction(): Unit

public func wovenFunction(): Unit {
    println("wovenFunction")
}

main() {
    println("start")
    wovenFunction()
    println("end")
    0
}

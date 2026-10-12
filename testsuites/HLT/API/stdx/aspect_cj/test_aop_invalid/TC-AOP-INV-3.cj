/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-INV-3
 * @TestCaseName: stdx.aspect_cj — invalid: generic_func
 * @TestCaseType: 负面测试
 * @Design Description: 被注解函数带泛型形参（或属于泛型类型）
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Brief: 1. 构造违规：被注解函数带泛型形参（或属于泛型类型）
 * @Brief: 2. collect 阶段编译失败，断言报错锚
 * @Expect: 编译报错含「cannot be generic or belong to a generic type」
 */
// LEVEL: 2
// EXEC-PIPE-1: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix 2>&1 | compare %f
// ASSERT: scan cannot be generic or belong to a generic type
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspect_cj.*

@InsertAtEntry[packageName: "AOP_demo1", className: "", methodName: "wovenFunction", isStatic: false, recursive: false,
    funcTypeStr: "()->Unit"]
public func annotatedFunction<T>() {
    println("annotatedFunction")
}

public func wovenFunction(): Unit {
    println("wovenFunction")
}

main() {
    println("start")
    wovenFunction()
    println("end")
    0
}

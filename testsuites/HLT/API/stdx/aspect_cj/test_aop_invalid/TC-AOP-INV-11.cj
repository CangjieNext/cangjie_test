/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-INV-11
 * @TestCaseName: stdx.aspect_cj — invalid: replace_no_params
 * @TestCaseType: 负面测试
 * @Design Description: @ReplaceFuncBody 标注的全局形态切面函数没有任何形参
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Brief: 1. 构造违规：@ReplaceFuncBody 标注的全局形态切面函数没有任何形参
 * @Brief: 2. collect 阶段编译失败，断言报错锚
 * @Expect: 编译报错含「invalid parameter count」
 */
// LEVEL: 2
// EXEC-PIPE-1: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix 2>&1 | compare %f
// ASSERT: scan invalid parameter count
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspect_cj.*

@ReplaceFuncBody[packageName: "AOP_demo1", className: "", methodName: "wovenFunction", isStatic: false, recursive: false]
public func annotatedFunction(): Unit {
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

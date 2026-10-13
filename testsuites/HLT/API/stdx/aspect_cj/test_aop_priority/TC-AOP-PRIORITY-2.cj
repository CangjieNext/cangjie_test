/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-PRIORITY-2
 * @TestCaseName: stdx.aspect_cj — priority: generic_func_over_invalid_package_name
 * @TestCaseType: 负面测试
 * @Design Description: 错误优先级判定：同一份代码同时触发两处违规，collect 插件只报先检查的违规（同一函数叠加报最先违规；两函数按声明序各报一条）
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Brief: 1. 构造同时触发 generic_func_over_invalid_package_name 两违规的切面代码
 * @Brief: 2. collect 阶段编译，断言报错锚为先检查的违规
 * @Expect: 报错锚 = cannot be generic or belong to a generic type
 */
// LEVEL: 2
// EXEC-PIPE-1: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix 2>&1 | compare %f
// ASSERT: scan cannot be generic or belong to a generic type
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspect_cj.*

@InsertAtEntry[packageName: "AOP..demo1/bad", className: "", methodName: "wovenFunction", isStatic: false,
    recursive: false, funcTypeStr: "()->Unit"]
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

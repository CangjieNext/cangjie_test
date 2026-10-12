/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-INV-18
 * @TestCaseName: stdx.aspect_cj — invalid: class_name_mismatch
 * @TestCaseType: 负面测试
 * @Design Description: className 与目标函数宿主类型不匹配（静默不织入）
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Brief: 1. 构造违规：className 与目标函数宿主类型不匹配（静默不织入）
 * @Brief: 2. 静默不织入族：两阶段编译通过后运行，断言输出缺插桩行
 * @Expect: stdout 无 annotatedFunction 插桩行
 */
// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.weave_aspects.%host_dylib_suffix
// RUN-EXEC: %run_stdx %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan start
// ASSERT: scan end
// ASSERT: scan-not annotatedFunction

package AOP_demo1

import stdx.aspect_cj.*

@InsertAtEntry[packageName: "AOP_demo1", className: "NoSuchClass", methodName: "wovenFunction", isStatic: false,
    recursive: false, funcTypeStr: "()->Unit"]
public func annotatedFunction() {
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

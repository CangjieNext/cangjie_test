/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-PARAM-7
 * @TestCaseName: stdx.aspect_cj — @ReplaceFuncBody × (Int64)->Int64
 * @TestCaseType: 功能测试
 * @Design Description: EC 等价类：切面函数形参列表与被织入函数源码形参一致（ReplaceFuncBody 加原始闭包；funcTypeStr 不含隐式 receiver）
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Brief: 1. 声明形参适配 (Int64)->Int64 被织入函数的 @ReplaceFuncBody 切面函数
 * @Brief: 2. main() 按 start→调用→(打印返回值)→end 驱动
 * @Brief: 3. 两阶段编译后运行，验证 stdout 顺序与返回值
 * @Expect: stdout 顺序符合织入语义；返回值正确
 */
// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.weave_aspects.%host_dylib_suffix
// RUN-EXEC: %run_stdx %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan start\nannotatedFunction\nwovenFunction\n43\nend

package AOP_demo1

import stdx.aspect_cj.*

@ReplaceFuncBody[packageName: "AOP_demo1", className: "", methodName: "wovenFunction", isStatic: false, recursive: false]
public func annotatedFunction(x: Int64, original: (Int64) -> Int64): Int64 {
    println("annotatedFunction")
    let r = original(x)
    r
}

public func wovenFunction(x: Int64): Int64 {
    println("wovenFunction")
    x + 1
}

main() {
    println("start")
    let r = wovenFunction(42)
    println(r)
    println("end")
    0
}

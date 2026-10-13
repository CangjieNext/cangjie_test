/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-INV-5
 * @TestCaseName: stdx.aspect_cj — invalid: instance_to_global_static
 * @TestCaseType: 负面测试
 * @Design Description: 实例成员切面函数织入全局/静态成员函数（this 形态跨用）
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Brief: 1. 构造违规：实例成员切面函数织入全局/静态成员函数（this 形态跨用）
 * @Brief: 2. collect 阶段编译失败，断言报错锚
 * @Expect: 编译报错含「cannot be woven into a global or static member function」
 */
// LEVEL: 2
// EXEC-PIPE-1: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix 2>&1 | compare %f
// ASSERT: scan cannot be woven into a global or static member function
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspect_cj.*

public class AspectHost {
    @InsertAtEntry[packageName: "AOP_demo1", className: "", methodName: "wovenFunction", isStatic: false,
        recursive: false, funcTypeStr: "()->Unit"]
    public func annotatedFunction() {
        println("annotatedFunction")
    }
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

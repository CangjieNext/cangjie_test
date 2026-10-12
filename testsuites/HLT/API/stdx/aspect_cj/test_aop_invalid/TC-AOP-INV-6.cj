/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-INV-6
 * @TestCaseName: stdx.aspect_cj — invalid: instance_diff_this
 * @TestCaseType: 负面测试
 * @Design Description: 成员形态切面函数织入不同宿主类型的实例成员函数（receiver 不匹配）
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Brief: 1. 构造违规：成员形态切面函数织入不同宿主类型的实例成员函数（receiver 不匹配）
 * @Brief: 2. collect 阶段编译失败，断言报错锚
 * @Expect: 编译报错含「has an incompatible receiver type」
 */
// LEVEL: 2
// EXEC-PIPE-1: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix 2>&1 | compare %f
// ASSERT: scan has an incompatible receiver type
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspect_cj.*

public class AspectHost {
    @InsertAtEntry[packageName: "AOP_demo1", className: "OtherClass", methodName: "wovenFunction", isStatic: false,
        recursive: false, funcTypeStr: "()->Unit"]
    public func annotatedFunction() {
        println("annotatedFunction")
    }
}

public class OtherClass {
    public func wovenFunction(): Unit {
        println("wovenFunction")
    }
}

main() {
    println("start")
    let o = OtherClass()
    o.wovenFunction()
    println("end")
    0
}

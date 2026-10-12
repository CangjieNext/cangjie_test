/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-WEAVE-1
 * @TestCaseName: stdx.aspect_cj — @InsertAtEntry 织入 class WovenClass 静态成员函数
 * @TestCaseType: 功能测试
 * @Design Description: EC 等价类：织入系统（注解程度）× 被织入系统固定拓扑槽位（实例槽位 × 成员/全局两切面形态）
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Brief: 1. 声明带 @InsertAtEntry 注解的 public 切面函数 annotatedFunction
 * @Brief: 2. 声明被织入目标 class WovenClass 静态成员函数
 * @Brief: 3. main() 按 start→调用→end 打印标记点
 * @Brief: 4. libstdx.collect_aspects 收集 + libstdx.weave_aspects 织入两阶段编译后运行
 * @Expect: stdout 顺序 = start→annotatedFunction→wovenFunction→end
 */
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.weave_aspects.%host_dylib_suffix
// RUN-EXEC: %run_stdx %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan start\nannotatedFunction\nwovenFunction\nend

package AOP_demo1

import stdx.aspect_cj.*

@InsertAtEntry[packageName: "AOP_demo1", className: "WovenClass", methodName: "wovenFunction", isStatic: true,
    recursive: false, funcTypeStr: "()->Unit"]
public func annotatedFunction(): Unit {
    println("annotatedFunction")
}

public class WovenClass {
    public static func wovenFunction(): Unit {
        println("wovenFunction")
    }
}

main() {
    println("start")
    WovenClass.wovenFunction()
    println("end")
    0
}

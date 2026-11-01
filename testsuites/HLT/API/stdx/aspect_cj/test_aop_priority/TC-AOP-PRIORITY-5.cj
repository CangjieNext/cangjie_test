/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-PRIORITY-5
 * @TestCaseName: stdx.aspect_cj — priority: instance_diff_this_over_classname_recursive_conflict
 * @TestCaseType: 负面测试
 * @Design Description: 错误优先级判定：同一份代码同时触发两处违规，collect 插件只报先检查的违规（同一函数叠加报最先违规；两函数按声明序各报一条）
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Brief: 1. 构造同时触发 instance_diff_this_over_classname_recursive_conflict 两违规的切面代码
 * @Brief: 2. collect 阶段编译，断言报错锚为先检查的违规
 * @Expect: 报错锚 = has an incompatible receiver type
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

@InsertAtEntry[packageName: "AOP_demo1", className: "", methodName: "wovenFunction", isStatic: false, recursive: true,
    funcTypeStr: "()->Unit"]
public func aspectRecursive() {
    println("annotatedFunction")
}

main() {
    println("start")
    let o = OtherClass()
    o.wovenFunction()
    println("end")
    0
}

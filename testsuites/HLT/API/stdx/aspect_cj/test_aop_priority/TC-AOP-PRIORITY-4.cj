/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-PRIORITY-4
 * @TestCaseName: stdx.aspect_cj — priority: instance_to_global_static_over_instance_diff_this
 * @TestCaseType: 负面测试
 * @Design Description: 错误优先级判定：同一份代码同时触发两处违规，collect 插件只报先检查的违规（同一函数叠加报最先违规；两函数按声明序各报一条）
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Brief: 1. 构造同时触发 instance_to_global_static_over_instance_diff_this 两违规的切面代码
 * @Brief: 2. collect 阶段编译，断言报错锚为先检查的违规
 * @Expect: 报错锚 = cannot be woven into a global or static member function
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

public class AspectHostB {
    @InsertAtEntry[packageName: "AOP_demo1", className: "OtherClass", methodName: "wovenFunction", isStatic: false,
        recursive: false, funcTypeStr: "()->Unit"]
    public func annotatedFunctionB() {
        println("annotatedFunction")
    }
}

public class OtherClass {
    public func wovenFunction(): Unit {
        println("wovenFunction")
    }
}

public func wovenFunction(): Unit {
    println("wovenFunction")
}

main() {
    println("start")
    wovenFunction()
    let o = OtherClass()
    o.wovenFunction()
    println("end")
    0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-ORACLE-5
 * @TestCaseName: stdx.aspect_cj — oracle: aspect_no_param
 * @TestCaseType: 功能测试
 * @Design Description: 织入顺序不变量「aspect_no_param」：无形参 Insert 切面织入有形参函数：插桩无参调用，原实参照常透传
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Expect: stdout 顺序满足不变量 aspect_no_param
 */
// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.weave_aspects.%host_dylib_suffix
// RUN-EXEC: %run_stdx %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan start\nannotatedFunction\nwovenFunction\n43\nend

package AOP_demo1

import stdx.aspect_cj.*

@InsertAtEntry[packageName: "AOP_demo1", className: "", methodName: "wovenFunction", isStatic: false, recursive: false,
    funcTypeStr: "(Int64)->Int64"]
public func annotatedFunction(): Unit {
    println("annotatedFunction")
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

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-ORACLE-6
 * @TestCaseName: stdx.aspect_cj — oracle: replace_returns_original_value
 * @TestCaseType: 功能测试
 * @Design Description: 织入顺序不变量「replace_returns_original_value」：替换体经 original 透传原函数语义：返回值 = 原函数返回值
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Expect: stdout 顺序满足不变量 replace_returns_original_value
 */
// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.weave_aspects.%host_dylib_suffix
// RUN-EXEC: %run_stdx %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan start\nannotatedFunction\nwovenFunction\n43\nend

package AOP_demo1

import stdx.aspect_cj.*

public struct WovenStruct {
    @ReplaceFuncBody[packageName: "AOP_demo1", className: "WovenStruct", methodName: "wovenFunction", isStatic: false,
        recursive: false]
    public func annotatedFunction(x: Int64, original: (Int64) -> Int64): Int64 {
        println("annotatedFunction")
        let r = original(x)
        r
    }

    public func wovenFunction(x: Int64): Int64 {
        println("wovenFunction")
        x + 1
    }
}

main() {
    println("start")
    let w = WovenStruct()
    let r = w.wovenFunction(42)
    println(r)
    println("end")
    0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * @TestCaseID: TC-AOP-ORACLE-4
 * @TestCaseName: stdx.aspect_cj — oracle: replace_body_skips_original
 * @TestCaseType: 功能测试
 * @Design Description: 织入顺序不变量「replace_body_skips_original」：@ReplaceFuncBody 替换体不调用 original：原函数体完全缺席（官方「可调可不调」）
 * @Priority: P0
 * @Condition: 仓颉工具链及 stdx.aspect_cj 扩展库已安装
 * @Expect: stdout 顺序满足不变量 replace_body_skips_original
 */
// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.collect_aspects.%host_dylib_suffix
// EXEC: %compiler %import-cangjie-stdx -lstdx.aspect_cj %cmp_opt %f -o %output --plugin=%host-cangjie-dynamic-stdx-path/libstdx.weave_aspects.%host_dylib_suffix
// RUN-EXEC: %run_stdx %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan start\nannotatedFunction\nend

package AOP_demo1

import stdx.aspect_cj.*

@ReplaceFuncBody[packageName: "AOP_demo1", className: "", methodName: "wovenFunction", isStatic: false, recursive: false]
public func annotatedFunction(original: (Int64) -> Int64): Int64 {
    println("annotatedFunction")
    99
}

public func wovenFunction(x: Int64): Int64 {
    println("wovenFunction")
    x + 1
}

main() {
    println("start")
    wovenFunction(42)
    println("end")
    0
}

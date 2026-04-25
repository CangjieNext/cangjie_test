/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DESC: 用户源码中报错
// DEPENDENCE: m.cj
// EXEC: %compiler --compile-macro m.cj
// EXEC-PIPE-1: %compiler --diagnostic-format=noColor --error-count-limit=all %f -o %output | compare %f
// 应报错提示具体是哪个宏存在问题，并且提示用户使用--debug-macro查看宏展开后的结果
// ASSERT: scan error: the error originates in the macro `M` (consider using `--debug-macro` for more info)
// 应提示实际报错原因
// ASSERT: scan note: you may want to implement 'operator func +(right: Struct-String)' for type 'Int64'
// ASSERT: scan note: invalid binary operator '+' on type 'Int64' and 'Struct-String'
// ASSERT: scan y + ""
// 但不应该打印任何宏展开后的结果代码
// ASSERT: scan-not xxx

package user

import m.M

@M
func foo(y: Int64) {
    y + ""
}

main(): Unit {
}

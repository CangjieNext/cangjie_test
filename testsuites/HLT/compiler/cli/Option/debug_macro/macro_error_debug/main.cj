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
// 指定--debug-macro以生成宏展开后的源码文件
// EXEC-PIPE-1: %compiler --debug-macro --diagnostic-format=noColor --error-count-limit=all %f -o %output 2>&1 | compare %f
// 应报错提示具体是哪个宏存在问题，由于用户已指定--debug-macro，将不提示用户使用--debug-macro，且报错信息中将直接引用宏展开后的源文件
// ASSERT: scan error: invalid binary operator '+' on type 'Int64' and 'Struct-String'
// ASSERT: scan main.cj.macrocall
// ASSERT: scan y + ""
// ASSERT: scan note: you may want to implement 'operator func +(right: Struct-String)' for type 'Int64'
// 预期生成macrocall文件
// (!host_win) EXEC: test -f ./main.cj.macrocall
// (host_win) EXEC: if exist ./main.cj.macrocall (exit 0) else (exit 1)

package user

import m.M

@M
func foo(y: Int64) {
    y + ""
}

main(): Unit {
}

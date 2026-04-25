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
// EXEC-PIPE-1: %compiler --debug-macro --diagnostic-format=noColor --error-count-limit=all %f -o %output | compare %f

package user

import m.M

@M
func foo(y: Int64) {
    y
}

main(): Unit {
}

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
// EXEC: %compiler --debug-macro --diagnostic-format=noColor --error-count-limit=all %f -o %output
// EXEC-PIPE: %cat ./main.cj.macrocall | compare %f
// ASSERT: scan Emitted by MacroCall @M in main.cj
// ASSERT: scan End of the Emit
// 在老版本中macrocall文件中会带有行号信息，此处进行检查判定其不存在
// ASSERT: scan-not /* 24.1 */

package user

import m.M

@M
func foo(y: Int64) {
    y
}

main(): Unit {
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o b.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b.%middle %f -o %output 2>&1 | compare %f

//catelog:# 包和模块管理## 包### 包的导入#### 导入多个包--8
package p0

import p1.foo
import p2.foo
import {p1, p2, p1.*, p2.*}

main(): Int64 {
    var a1 = foo
    var a2 = p1.foo
    var a3 = p2.foo
    return 0
}
// ASSERT: scan sema_ambiguous_use

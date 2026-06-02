/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o p2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

//catelog:# 包和模块管理## 包### 包的导入#### 导入多个包--8
package p0

import p1.foo
import p2.foo as foo

main(): Int64 {
    var a2 = foo.f
    if (a2 != 12) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_ambiguous_use

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o a.%middle
// EXEC-PIPE-0: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
//catelog:# 包和模块管理## 包### 包的导入#### 导入多个包--8
import p1.foo as A

var A = 1

main(): Int64 {
    return 0
}
// ASSERT: scan package_shadowed_import

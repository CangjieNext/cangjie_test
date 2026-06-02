/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg.cj
// EXEC-PIPE-1: %compiler %cmp_opt pkg.cj %f -o %output 2>&1 | compare %f

package class_var__private

func run(): Int64 {
    var data: Data = Data()
    var test: Int32 = data.a
    if (test != 1) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_invalid_access_control
// ASSERT: scan sema_mismatched_types

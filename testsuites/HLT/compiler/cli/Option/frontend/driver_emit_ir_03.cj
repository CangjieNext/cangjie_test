/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not OHOS) EXEC-PIPE-1: %compiler_frontend %cmp_opt_frontend %f 2>&1 | compare %f

main(): Int64 {
    var a: Int32 = 1
    if (a < b) {
        print("hello,worldn")
        return 0
    }
    return 1
}
// (not OHOS) ASSERT: scan sema_undeclared_identifier

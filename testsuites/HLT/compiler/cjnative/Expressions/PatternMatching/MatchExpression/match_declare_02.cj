/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var input: Int32 = 1
var f = match (input) {
    case x =>
        var a: Int32 = 1;
        var x1 = {=> a}
}

main(): Int64 {
    if (f != ()) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_use_func_capture_var_alone

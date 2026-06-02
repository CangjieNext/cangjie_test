/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

main(): Int64 {
    var a: Int8 = 8
    var b = none //此处需要确认仓颉语言的空是否为none
    a = 12 << b
    a = 12 >> b
    return 0
}
// ASSERT: scan sema_undeclared_identifier

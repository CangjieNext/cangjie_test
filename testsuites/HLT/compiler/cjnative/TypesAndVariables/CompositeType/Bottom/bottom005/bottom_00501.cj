/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test(): Int64 {
    var a: Int64 = return 1 // definition is Unit type, block is Unit type, not match Int64.
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_mismatched_types

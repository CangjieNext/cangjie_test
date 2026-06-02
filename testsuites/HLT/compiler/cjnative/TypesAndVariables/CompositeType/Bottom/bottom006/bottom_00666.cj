/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

// range type not match Int64
// func test():Int64 = (return 1) .. (return 2): (return 3)

func test(): Int64 {
    (return 1)..(return 2) : (return 3)
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_mismatched_types

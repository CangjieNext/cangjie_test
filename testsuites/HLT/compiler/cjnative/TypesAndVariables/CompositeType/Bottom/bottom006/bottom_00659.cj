/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

// tuple type not match Int64
// func test():Int64 = (return 1,return 2, return 3, return 4, return 5)

func test(): Int64 {
    ((return 1), (return 2), (return 3), (return 4), (return 5))
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_mismatched_types

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

// return Int64 type not match Array.
// func test():Array<Int64> = [return 1, return 2]

func test(): Array<Int64> {
    [(return 1), (return 2)]
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_cannot_convert_literal

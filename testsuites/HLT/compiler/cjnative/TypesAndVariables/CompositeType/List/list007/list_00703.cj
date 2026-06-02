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
    var a: Array<Int64> = [1, 2, 3]
    var b: Array<Int32> = [1, 2, 3]
    a = b
    return 0
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_mismatched_types

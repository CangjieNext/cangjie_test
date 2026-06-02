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
    let a: List<Int64> = [1, 2, 3]
    var b: List<Int64> = [0]
    a = b
    return a[0]
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_undeclared_type_name
// ASSERT: scan sema_cannot_assign_to_immutable

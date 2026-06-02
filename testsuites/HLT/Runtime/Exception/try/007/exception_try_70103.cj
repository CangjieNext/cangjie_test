/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A <: Exception {}

func test(): Unit {
    throw throw A()
}

main() {
    test()
    return 0
}
// ASSERT: scan sema_throw_expr_with_wrong_type

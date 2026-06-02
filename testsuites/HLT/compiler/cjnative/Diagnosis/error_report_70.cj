/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

func foo(x!: Int64, y!: Int64) {}

main() {
    foo(x: 1, x: 1)

    return 0
}
// ASSERT: scan sema_multiple_named_argument

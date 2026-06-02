/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan parse_expected_decl



main() {
    @When[debug]
    { a: Int64, b: Int64 => a + b }
    @When[!debug]
    { a: Int64, b: Int64 => a + b }
    return 0
}
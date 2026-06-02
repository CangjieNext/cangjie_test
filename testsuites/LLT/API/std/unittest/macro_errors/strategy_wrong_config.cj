/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan error: 'asdf' is not a member of class 'Configuration'
// ASSERT: scan mismatched types
// ASSERT: scan expected 'Int64', found 'Struct-String'
@Strategy[config.asdf in [ 1, 2, 3 ]]
func test1(): Int64 {
    5
}

@Strategy[config.minBatches in [ "1", "2" ]]
func test2(): Int64 {
    5
}

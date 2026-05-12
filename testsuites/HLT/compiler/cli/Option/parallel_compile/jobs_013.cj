/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not MAC and not Windows) ERRCHECK: %compiler %cmp_opt --jobs 10000000000000000000000000 %f -o %output
// (not MAC and not Windows) ASSERT: scan '--jobs' gets an invalid number input.

main(): Int64 {
    return 0
}

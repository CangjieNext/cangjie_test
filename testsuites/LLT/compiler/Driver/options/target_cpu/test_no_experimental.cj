// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC-PIPE-1: %compiler %cmp_opt %f -o main %verbose_opt --target-cpu=generic 2>&1 | compare %f
//  ASSERT: regex error.*: --target-cpu=generic is an experimental feature
//  ASSERT: scan "--experimental" option is required to enable experimental features.

main() {
    return 0
}

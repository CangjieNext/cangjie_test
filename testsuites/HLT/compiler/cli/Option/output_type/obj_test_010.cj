// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f  --output-type=obj  --compile-target=exe -o main.o 2>&1 | compare %f
// ASSERT: scan --output-type=obj is an experimental feature. "--experimental" option is required to enable experimental features.

main() {
    println("Hello cangjie!")
}

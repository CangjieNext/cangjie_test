// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f  --output-type=obj  --compile-target=obj -o main.o --experimental 2>&1 | compare %f
// ASSERT: scan invalid value: 'obj'

main() {
    println("Hello cangjie!")
}

// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f --compile-target=dylib -o main.o --experimental 2>&1 | compare %f
// ASSERT: scan --compile-target only takes effect when --output-type=obj, this option will be ignored in other scenarios

main() {
    println("Hello cangjie!")
}

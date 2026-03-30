// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  --output-type=obj  --compile-target=exe -o main.o --experimental
// EXEC-PIPE-1: %compiler main.o -lcangjie-std-core -o %output 2>&1 | compare %f
// ASSERT: scan compilation with input object files is currently experimental and requires the --experimental flag to be enabled

main() {
    println("Hello cangjie!")
}

// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 1
// EXEC: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %f --output-type=obj --compile-target=dylib -o main.o --experimental
// EXEC: %compiler %cmp_opt main.o -lcangjie-std-core --output-type=dylib --experimental -o %output
// EXEC: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %f --output-type=obj -o main.o --experimental
// EXEC: %compiler %cmp_opt main.o -lcangjie-std-core --experimental -o %output
// RUN-EXEC-PIPE: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan Hello cangjie!

main() {
    println("Hello cangjie!")
}

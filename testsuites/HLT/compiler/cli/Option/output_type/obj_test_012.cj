// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  --output-type=obj  --compile-target=exe -o main.o --experimental
// EXEC-PIPE-1: %compiler main.o -lcangjie-std-cored --experimental -o %output 2>&1 | compare %f
// (host_win)ASSERT: scan unable to find library -lcangjie-std-cored
// (host_linux)ASSERT: scan /usr/bin/ld: cannot find -lcangjie-std-cored: No such file or directory
// (host_mac)ASSERT: scan library not found for -lcangjie-std-cored

main() {
    println("Hello cangjie!")
}

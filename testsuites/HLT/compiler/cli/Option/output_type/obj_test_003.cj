// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: foo.cj
// EXEC: %compiler %cmp_opt foo.cj --output-type=obj --compile-target=staticlib --experimental
// EXEC: %ls
// (!host_win) EXEC-1: test -f foo.cjo.flag
// (host_win) EXEC-1: if exist foo.cjo.flag (exit 0) else (exit 1)
// EXEC: %compiler %cmp_opt %f --output-type=obj --compile-target=exe --experimental
// EXEC: %compiler %cmp_opt %n.%object_file_suffix foo.%object_file_suffix -lcangjie-std-core --experimental -o %output
// EXEC: %ls
// RUN-EXEC: %run %run_opt %output 


import foo.*

main(): Int64 {
    test()
}

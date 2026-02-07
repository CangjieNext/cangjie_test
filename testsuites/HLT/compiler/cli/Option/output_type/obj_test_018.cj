// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 1
// DEPENDENCE: foo.cj
// EXEC: %compiler %cmp_opt foo.cj --output-type=obj --compile-target=staticlib --experimental
// (!host_win) EXEC: test -f foo.cjo.flag
// (host_win) EXEC: if exist foo.cjo.flag (exit 0) else (exit 1)
// EXEC-PIPE-1: %compiler foo.%object_file_suffix -lcangjie-std-core --experimental -o %output 2>&1 | compare %f
// (host_win)ASSERT: scan ld.lld: error: undefined symbol: WinMain
// (!host_win)ASSERT: scan undefined reference to `main'


import foo.*

main(): Int64 {
    test()
}

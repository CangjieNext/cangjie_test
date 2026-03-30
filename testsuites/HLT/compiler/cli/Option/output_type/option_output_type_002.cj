// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: foo.cj
// EXEC: %compiler %cmp_opt foo.cj --output-type=staticlib
// EXEC: %ls
// (!host_win) EXEC: test -f foo.cjo.flag
// (host_win) EXEC: if exist foo.cjo.flag (exit 0) else (exit 1)
// (!host_win) EXEC: test -f foo.cjo
// (host_win) EXEC: if exist foo.cjo (exit 0) else (exit 1)
// EXEC: %compiler %cmp_opt %f --output-type=obj --compile-target=exe --experimental


import foo.*

main(): Int64 {
    test()
}

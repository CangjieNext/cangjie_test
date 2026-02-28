/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %mkdir dir
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f --output-dir ./dir
// (!host_win) EXEC: test -f dir/lib%n.%test_suffix
// (!host_win) EXEC: test -f dir/default.cjo
// (host_win) EXEC: if exist dir/lib%n.%test_suffix (exit 0) else (exit 1)
// (host_win) EXEC: if exist dir/default.cjo (exit 0) else (exit 1)

func test() {
    return 0
}

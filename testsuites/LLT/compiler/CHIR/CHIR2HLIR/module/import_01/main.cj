// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: cj-cache-tag2
// EXEC:%compiler %import-cangjie-stdx %pkg_opt cj-cache-tag2/src/cache -o libcache.%middle %compile_lib_opt
// EXEC:%compiler %import-cangjie-stdx %pkg_opt cj-cache-tag2/src libcache.%middle -o %output
// EXEC: %set_stdx_path %run %run_opt %output %run_args

main(): Int64 {
    return 0
}

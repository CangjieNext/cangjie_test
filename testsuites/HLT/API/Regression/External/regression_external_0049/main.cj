/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: cj-cache-tag2
// EXEC:%compiler %cmp_opt %import-cangjie-stdx %pkg_opt cj-cache-tag2/src/cache %compile_lib_opt -o libcache.%middle
// EXEC:%compiler %cmp_opt %import-cangjie-stdx %pkg_opt cj-cache-tag2/src libcache.%middle -o %output
// RUN-EXEC: %run_stdx %output %run_args

main(): Int64 {
    return 0
}

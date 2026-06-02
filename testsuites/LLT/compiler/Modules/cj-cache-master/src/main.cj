// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../cj-cache-master
// EXEC: %compiler %pkg_opt ./cj-cache-master/src/cache %compile_lib_opt -o libcache.%middle
// EXEC: %compiler %pkg_opt ./cj-cache-master/src libcache.%middle
// EXEC-0: %run %run_opt %main

internal import cache.*

main() {
    let cache = Cache<Int64>()
    cache.Set()
}

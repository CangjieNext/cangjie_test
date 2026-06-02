// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg
// EXEC:%compiler %pkg_opt pkg/src/pkg3 %compile_shared_lib_opt -o libpkg.%dylib_suffix 
// EXEC:%compiler pkg/main.cj -lpkg -L./ -o %output

main(): Int64 {
    return 0
}

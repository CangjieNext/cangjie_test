// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// (Linux)EXEC: echo 'k="v"' > pkg/cfg.toml
// (Linux)EXEC:%compiler %cmp_opt %compile_lib_opt %pkg_opt pkg -o pkg/pkg.%middle
// (Linux)EXEC:%compiler %cmp_opt pkg/pkg.%middle %n.cj --import-path pkg -o %output

internal import pkg.*

main() {
    return foo()
}

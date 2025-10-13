// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg %n.not_cjnative.expect %n.cjnative.expect
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/a.cj -o pkg.%middle
// (not CJNATIVE) EXEC-PIPE-1: %compiler %cmp_opt pkg.%middle %n.cj 2>&1 | compare %n.not_cjnative.expect
// (CJNATIVE) EXEC-PIPE-1: %compiler %cmp_opt pkg.%middle %n.cj 2>&1 | compare %n.cjnative.expect
internal import pkg.I

main() {
    var a = Some(1)
    a.f()
}

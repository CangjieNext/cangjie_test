// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj %f.expect
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f --debug-macro -o %output
// EXEC: %diff %f.macrocall %f.expect

import define.*

var a = 1

@M(
func test() {
    a >>= (a & 7)
}
)

main() {
    0
}

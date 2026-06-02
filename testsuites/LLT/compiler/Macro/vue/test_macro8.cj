// DEPENDENCE: test_macro1.cj %f.expect
// EXEC: %compiler %cmp_macro test_macro1.cj
// EXEC: %run_macro %compiler %cmp_opt %f --debug-macro -o %output
// EXEC: %diff %f.macrocall %f.expect

import view.*

main(): Int64 {
    @callView4(1)
    return 0
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

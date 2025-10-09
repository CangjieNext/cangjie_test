/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: test_debug_macro_define.cj %f.expect
// EXEC: %compiler %cmp_macro test_debug_macro_define.cj 
// EXEC: %compiler %cmp_opt %f %macro_debug
// EXEC: %diff %f.macrocall %f.expect

import define.*

main() {
     @M()
    0
}

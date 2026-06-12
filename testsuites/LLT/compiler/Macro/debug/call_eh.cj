// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define_eh.cj 
// EXEC: %compiler %enableEH %cmp_macro define_eh.cj
// EXEC: %run_macro %set_stdx_path %compiler %enableEH %cmp_opt  %f -o %output %macro_debug

package demo_eh

import pkg_eh.*
import stdx.effect.Command

main() {
    @Foo()
    0
}

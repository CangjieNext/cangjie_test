/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_define_40015.cj
// EXEC: %compiler %cmp_macro macro_define_40015.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f %macro_debug -o %output

package test

import define_40015.X as Y
import define_40015.Y as X

main() {
    @define_40015.Y
    var x = 0
    @define_40015.Y(0) + x

    @define_40015.X[123]
    var x1 = 0
    @define_40015.X[123](0) + x1
}
// ASSERT: scan macro_undefined_pkg_name

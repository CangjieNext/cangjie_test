// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkgA.cj pkgB.cj pkgC.cj
// EXEC: %compiler %cmp_opt %compile_shared_lib_opt %disableAPC -lA -L . pkgA.cj -o libA.%dylib_suffix
// EXEC: %compiler %cmp_opt %compile_shared_lib_opt %disableAPC -lA -L . pkgB.cj -o libB.%dylib_suffix
// EXEC: %compiler %cmp_opt %compile_shared_lib_opt %disableAPC -lA -L . pkgC.cj -o libC.%dylib_suffix
// EXEC: %compiler %cmp_opt %disableAPC %f -lA -lB -lC -L . -o %output
// RUN-EXEC: %output

import A.*
import B.*
import C.*

main() {
    var x: IC = CB()
    x.goo()
}
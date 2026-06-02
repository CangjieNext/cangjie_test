// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../base ../classes
// EXEC: %compiler %pkg_opt base %compile_lib_opt -o base.%middle
// EXEC-PIPE: %compiler %pkg_opt classes %compile_lib_opt -o classes.%middle | compare %f

package classes

internal import base.*

func func1() {
    let base = Base()
    println(base.name)
}

/* SCAN
*/

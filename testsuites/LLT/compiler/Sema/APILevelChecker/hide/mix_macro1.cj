// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: hide.cj ../level/apilevel.cj mix_macro_dep.cj mix_macro_dep1.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt hide.cj apilevel.cj -o hide.%middle
// EXEC: %compiler %cmp_opt %cmp_macro mix_macro_dep.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt mix_macro_dep1.cj -o mix_macro_dep1.%middle
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt hide.%middle %n.cj -o %n.%suffix -Woff all --cfg=APILevel_level=20

package ohos.dep

import ohos.labels.*
import m.*
import anno.*

@!Hide[isChecked: true]
@M
public open class A {
}

@!Hide[isChecked: true]
@CustomAnno
public open class B {
}

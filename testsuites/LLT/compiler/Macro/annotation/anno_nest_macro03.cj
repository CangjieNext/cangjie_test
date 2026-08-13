// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: anno_nest_macro03_define.cj anno_nest_macro03_helper.cj
// EXEC: %compiler %compile_lib_opt anno_nest_macro03_helper.cj -o libanno_nest_macro03_helper.%lib_extension
// EXEC: %compiler %cmp_macro anno_nest_macro03_define.cj -L . -l anno_nest_macro03_helper
// EXEC: %run_macro %compiler %cmp_opt %f -L . -l anno_nest_macro03_helper -o %output
// EXEC: %run %run_opt %output

import anno_nest_macro03_define.*

@Annotation[target: [Type]]
public class BeanMeta {
    public const BeanMeta(public let name!: String = '') {}
}

@Pointcut
@BeanMeta[name: 'controller']
public class Controller {}

main() {}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define1.cj define2.cj
// EXEC: %compiler define1.cj %cmp_macro
// EXEC: %compiler define2.cj %cmp_macro
// EXEC: %compiler %cmp_opt %f -o %output

// RUN-EXEC: %run %run_opt %output %run_args
import define1.*
import define2.*

main() {
    @M(var b = 1)
    b - 3
}

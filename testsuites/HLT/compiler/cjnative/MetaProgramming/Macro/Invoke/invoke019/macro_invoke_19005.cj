/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define2.cj
// EXEC: %compiler %cmp_macro define2.cj
// EXEC-1: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

@Context002
@Context001
func foo() {
    println("88888888")
}

main() {
    foo()
}

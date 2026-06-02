/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_class.cj
// EXEC: %compiler %cmp_macro define_class.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define_class.*

@M[x]
class A<T> {}

main() {
    A<Int64>()
    return 0
}
// ASSERT: scan sema_generic_argument_no_match

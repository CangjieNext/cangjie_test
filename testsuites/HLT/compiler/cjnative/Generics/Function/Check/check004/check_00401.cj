/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: 401.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt 401.cj
// ERRCHECK: %compiler %cmp_opt %f -o %output

import test401

class Z<a, b, c> where a <: test401.A<Int64, Int64>, b <: test401.B<Int64, Int64>, c <: test401.C<Int64, Int64> {}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions

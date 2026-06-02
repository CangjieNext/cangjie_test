/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: 401.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt 401.cj -o 401.%middle
// ERRCHECK: %compiler %cmp_opt %f 401.%middle -o %output

import test401.*

func test(a: A<Int64, Int64>, b: B<Int64, Int64>, c: C<Int64, Int64>) {}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions

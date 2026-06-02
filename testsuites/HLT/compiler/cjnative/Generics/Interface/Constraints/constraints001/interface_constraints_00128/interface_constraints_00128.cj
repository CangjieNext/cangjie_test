/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./a
// EXEC: %compiler %cmp_opt %compile_lib_opt ./a/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt  %f a.%middle -o %output

import a

interface I<X> where X <: a.A {}

main() {
    return 0
}

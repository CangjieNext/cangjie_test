/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./packagesToCheckConsistency/p1
// (CJNATIVE) EXEC: %compiler %pkg_opt -Woff=all -p p1 -o libpkg1.%middle --mock=on %compile_lib_opt
// (CJNATIVE) EXEC-1: %compiler %cmp_opt -Woff=all libpkg1.%middle %n.cj -o %output 2>&1 | compare %f

import p1.*

main() {
    1
}

/* SCAN-IN
dependent package 'p1' is compiled with mocking support, the current package must be compiled with mocking support too (pass '--mock=on' compilation option)
 */

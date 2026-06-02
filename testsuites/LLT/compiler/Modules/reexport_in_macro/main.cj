// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define1 define2 pkg1 pkg2
// (CJNATIVE) EXEC: %compiler %cmp_opt %compile_shared_lib_opt -p pkg1
// (CJNATIVE) EXEC: %compiler %cmp_opt %cmp_macro -p define1 -L. -lpkg1
// (CJNATIVE) EXEC: %compiler %cmp_opt %cmp_macro -p define2 -L. -lpkg1
// (CJNATIVE) EXEC: %compiler %cmp_opt %compile_shared_lib_opt -p pkg2 -L. -lpkg1
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %main -L. -lpkg1 -lpkg2

// (not CJNATIVE) EXEC: %compiler %cmp_opt %compile_shared_lib_opt -p pkg1 -o pkg1.%lib_extension
// (not CJNATIVE) EXEC: %compiler %cmp_opt %cmp_macro -p define1 pkg1.%lib_extension
// (not CJNATIVE) EXEC: %compiler %cmp_opt %cmp_macro -p define2 pkg1.%lib_extension
// (not CJNATIVE) EXEC: %compiler %cmp_opt %compile_shared_lib_opt -p pkg2 pkg1.%lib_extension -o pkg2.%lib_extension
// (not CJNATIVE) EXEC: %compiler %cmp_opt %f -o %main pkg1.%lib_extension pkg2.%lib_extension

// EXEC: %run %run_opt %main

import define2.*
import pkg2.*

main() {
    a
}

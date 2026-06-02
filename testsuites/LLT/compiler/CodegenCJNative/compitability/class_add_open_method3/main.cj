// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkga.cj pkga_new.cj
// EXEC: %compiler pkga.cj %compile_shared_lib_opt -o libpkga.%dylib_suffix
// EXEC: %compiler %f -L. -lpkga -o %output
// EXEC: %compiler pkga_new.cj %compile_shared_lib_opt -o libpkga.%dylib_suffix

// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 2\n3\n

import lib.pkgA.*

main() {
    test<I1>(CA())
}
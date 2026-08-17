// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) DEPENDENCE: pkgs pkga
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs/pkgs.cj -o libpkgs.bc
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga/pkga.cj -o libpkga.bc
// (Linux and CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %verbose_opt --lto=full --disable-reflection %f libpkgs.bc libpkga.bc -o %output 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: regex (llvm-link|llvm-lto|opt|lld)
// (Linux and CJNATIVE) ASSERT: scan-not --cj-disable-lto-reflection
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

import pkgs
import pkga

main(): Int64 {
    let name1 = pkgs.reflectName()
    let name2 = pkga.reflectName()
    if (name1.isEmpty() || name2.isEmpty()) {
        return 1
    }
    return 0
}

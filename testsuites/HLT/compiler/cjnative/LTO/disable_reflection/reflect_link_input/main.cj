// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full --disable-reflection %f libpkgs.bc libpkga.bc libpkgb.bc -o %output -V 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: regex (llvm-link|llvm-lto|opt|lld)
// (target_linux | target_android | target_ohos) ASSERT: scan-not --cj-disable-lto-reflection
// (target_linux | target_android | target_ohos) RUN-EXEC: %run %run_opt %output %run_args

package tmp_test

import pkgs
import pkga
import pkgb

main(): Int64 {
    let name1 = pkgs.reflectName()
    let name2 = pkga.reflectName()
    if (name1.isEmpty() || name2.isEmpty()) {
        return 1
    }
    if (!pkgs.reflectAll() || !pkga.reflectAll()) {
        return 2
    }
    if (pkgs.reflectShape().isEmpty() || pkga.reflectShape().isEmpty()) {
        return 3
    }
    if (pkgs.reflectMeta().isEmpty() || pkgs.reflectInt().isEmpty()) {
        return 4
    }
    let d: pkgs.Data<Int64> = pkgs.Data<Int64>(3, 4)
    if (d.area() != 3) {
        return 5
    }
    let s = pkgs.Shape()
    if (s.ownerName() != "pkgs-shape") {
        return 6
    }
    if (pkgs.Meta().ver() != 1) {
        return 7
    }
    if (pkgb.reflectName().isEmpty() || !pkgb.reflectAll()) {
        return 8
    }
    return 0
}

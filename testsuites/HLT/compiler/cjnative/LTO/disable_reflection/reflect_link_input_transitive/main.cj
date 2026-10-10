// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj middle.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full middle.cj -o libmiddle.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full --disable-reflection %f libpkgs.bc libpkga.bc libpkgb.bc libmiddle.bc -o %output -V 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: regex (llvm-link|llvm-lto|opt|lld)
// (target_linux | target_android | target_ohos) ASSERT: scan-not --cj-disable-lto-reflection
// (target_linux | target_android | target_ohos) RUN-EXEC: %run %run_opt %output %run_args

package tmp_test

import pkgs
import pkga
import pkgb

main(): Int64 {
    let name = pkga.reflectName()
    let data1: pkgs.Data<Int32> = pkgs.makeData(3, 4)
    if (name.isEmpty() || data1.area() != 3) {
        return 1
    }
    if (!pkga.reflectBoth()) {
        return 2
    }
    if (data1.sizeOf() != 2 || data1.summary() != "pkgs-origin#1" || !data1.isOrigin()) {
        return 3
    }
    var bx: pkgb.Box3<Int64> = pkgb.Box3<Int64>(1, 2, 3, 0)
    if (bx.volume() != 6 || pkgb.modeValue(pkgb.Mode.On(9)) != 9) {
        return 4
    }
    return 0
}

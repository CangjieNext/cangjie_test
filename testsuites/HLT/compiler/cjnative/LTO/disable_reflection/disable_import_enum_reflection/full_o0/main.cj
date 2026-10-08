// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full --disable-reflection %f libpkgs.bc libpkga.bc libpkgb.bc -o %output
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full %f libpkgs.bc libpkga.bc libpkgb.bc -o main_reflect.out
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:E.ti.enumctors
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:E.ti.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgs:E.ti.method0
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:G.ti.enumctors
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:G.ti.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgb:G.ti.method0
// (target_linux | target_android | target_ohos) EXEC: test $(stat -c %s %output) -lt $(stat -c %s main_reflect.out)
// (target_linux | target_android | target_ohos) RUN-EXEC: %run %run_opt %output %run_args

package tmp_test

import pkgs
import pkga
import pkgb

main(): Int64 {
    let e1 = pkgs.E.A
    let e2 = pkga.E.A(3)
    if (pkgs.tagE(e1) != 1 || pkga.tagEa(e2) != 3) {
        return 1
    }
    if (pkgs.tagF(pkgs.F.A(3)) != 3 || pkga.tagFa(pkga.F.A(9)) != 1) {
        return 2
    }
    if (pkgs.useEnum(pkgs.E.A) != 101) {
        return 3
    }
    if (pkgs.useEnum(pkgs.makeB(5)) != 105) {
        return 4
    }
    if (pkgs.useEnum(pkgs.makeC("s", false)) != 97) {
        return 5
    }
    if (pkga.useEnum(pkga.makeA(3)) != 203) {
        return 6
    }
    if (pkgs.enumTagBase != 100 || pkga.enumTagBase != 200) {
        return 7
    }
    if (pkgs.enumUses != 3 || pkga.enumUses != 1) {
        return 8
    }
    if (pkgb.gValue(pkgb.G.A) != 0) {
        return 9
    }
    if (pkgb.gValue(pkgb.G.B(9)) != 9 || pkgb.gValue(pkgb.G.C("x", false)) != -1) {
        return 10
    }
    if (pkgb.hTag(pkgb.H.P(1.5)) != 1) {
        return 11
    }
    let c: pkgb.Carrier<Int64> = pkgb.Carrier<Int64>(42, 1)
    if (c.get() != 42) {
        return 12
    }
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=thin --disable-reflection %f libpkgs.bc libpkga.bc libpkgb.bc -o %output
// (target_linux | target_android | target_ohos) EXEC: rm -rf llvmcache-*
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=thin %f libpkgs.bc libpkga.bc libpkgb.bc -o main_reflect.out
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Shape.tt.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Shape.tt.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgs:Shape.tt.method0
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:Panel.tt.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:Panel.tt.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgb:Panel.tt.method0
// (target_linux | target_android | target_ohos) EXEC: test $(stat -c %s %output) -lt $(stat -c %s main_reflect.out)
// (target_linux | target_android | target_ohos) RUN-EXEC: %run %run_opt %output %run_args

package tmp_test

import pkgs
import pkga
import pkgb

main(): Int64 {
    return run()
}

func run(): Int64 {
    let s1: pkgs.Shape<Int32> = pkgs.makeShape(3, 4)
    let s2: pkga.Shape<Int32> = pkga.makeShape(4, 3)
    if (s1.area() != 3 || s2.area() != 4) {
        return 1
    }
    if (s1.ownerTag() != "pkgs-7" || s2.ownerTag() != "pkga-7") {
        return 2
    }
    if (s1.identify() != "base-7") {
        return 3
    }
    if (s1.perimeter != 28) {
        return 4
    }
    let scaled: pkgs.Measurable = s1.scale(2)
    if (scaled.perimeter != 28) {
        return 5
    }
    if (pkgs.Shape<Int64>.zero().area() != 0) {
        return 6
    }
    if (pkgs.shapeOwner.isEmpty() || pkgs.shapeCount != 1 || pkga.shapeCount != 1) {
        return 7
    }
    let p: pkgb.Panel<Int32> = pkgb.Panel<Int32>(3, 4)
    if (p.area() != 3) {
        return 8
    }
    if (p.draw() != "panel#11" || p.widgetName() != "widget-11") {
        return 9
    }
    if (pkgb.Panel<Int64>.blank().area() != 0) {
        return 10
    }
    let dr: pkgb.Drawable = p
    if (dr.draw() != "panel#11") {
        return 11
    }
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 场景：不指定 --disable-reflection + ThinLTO（对照组 thin 变体）
// 预期：不触发裁剪 —— method0 反射符号完整保留、reflect 未降级 .dbg、运行正常
// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=thin -O2 %f libpkgs.bc libpkga.bc libpkgb.bc -o %output
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Data.tt.method0
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Data.tt.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgs:Data.tt.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:Box3.tt.method0
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:Box3.tt.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgb:Box3.tt.reflect.dbg
// (target_linux | target_android | target_ohos) RUN-EXEC: %run %run_opt %output %run_args

package tmp_test

import pkgs
import pkga
import pkgb

main(): Int64 {
    return run()
}

func run(): Int64 {
    let data1: pkgs.Data<Int32> = pkgs.makeData(3, 4)
    let data2: pkga.Data<Int32> = pkga.makeData(4, 3)
    if (data1.area() != 3 || data2.area() != 4) {
        return 1
    }
    if (data1.sizeOf() != 2 || data2.sizeOf() != 2) {
        return 2
    }
    if (data1.summary() != "pkgs-origin#1" || data2.summary() != "pkga-origin#1") {
        return 3
    }
    if (!data1.isOrigin()) {
        return 4
    }
    if (pkgs.Data<Int64>.unit().area() != 1) {
        return 5
    }
    if (pkgs.defaultLabel.isEmpty() || pkga.defaultLabel.isEmpty()) {
        return 6
    }
    if (pkgs.bump() != 1 || pkgs.bump() != 2) {
        return 7
    }
    var bx: pkgb.Box3<Int64> = pkgb.Box3<Int64>(1, 2, 3, 0)
    if (bx.volume() != 6) {
        return 8
    }
    if (bx.name() != "pkgb-box") {
        return 9
    }
    bx.rename("renamed")
    if (bx.name() != "renamed") {
        return 10
    }
    if (pkgb.modeValue(pkgb.Mode.On(9)) != 9) {
        return 11
    }
    if (pkgb.modeValue(pkgb.Mode.Auto("x", false)) != -1) {
        return 12
    }
    let tg = pkgb.Tagged()
    if (tg.name() != "tagged") {
        return 13
    }
    return 0
}

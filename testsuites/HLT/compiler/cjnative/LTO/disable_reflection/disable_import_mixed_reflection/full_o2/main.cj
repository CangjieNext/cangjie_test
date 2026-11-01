// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full -O2 --disable-reflection %f libpkgs.bc libpkga.bc libpkgb.bc -o %output
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full -O2 %f libpkgs.bc libpkga.bc libpkgb.bc -o main_reflect.out
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Data.tt.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Data.tt.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgs:Data.tt.method0
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Shape.tt.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Shape.tt.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgs:Shape.tt.method0
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:E.ti.enumctors
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:E.ti.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgs:E.ti.method0
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:Frame.tt.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:Frame.tt.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgb:Frame.tt.method0
// (target_linux | target_android | target_ohos) EXEC: test $(stat -c %s %output) -lt $(stat -c %s main_reflect.out)
// (target_linux | target_android | target_ohos) RUN-EXEC: %run %run_opt %output %run_args

package tmp_test

import pkgs
import pkgb

main(): Int64 {
    let d: pkgs.Data<Int32> = pkgs.Data<Int32>(3, 4)
    d.stamp("first")
    if (d.area() != 3) {
        return 1
    }
    if (d.tags.size != 1) {
        return 2
    }
    let s: pkgs.Shape<Int64> = pkgs.Shape<Int64>(3, 4)
    if (s.area() != 3 || s.describe() != "shape") {
        return 3
    }
    let desc: pkgs.Describable = s
    if (desc.describe() != "shape") {
        return 4
    }
    let b: pkgs.Box = pkgs.makeBox(3, 4)
    if (b.sealedArea() != 6) {
        return 5
    }
    b.unseal()
    if (b.sealedArea() != 3) {
        return 6
    }
    if (pkgs.tagE(pkgs.E.A) != 1) {
        return 7
    }
    if (pkgs.tagF(pkgs.F.A(3)) != 3) {
        return 8
    }
    if (pkgs.identity<Int64>(42) != 42 || pkgs.identity<String>("x") != "x") {
        return 9
    }
    if (pkgs.instanceCount != 1) {
        return 10
    }
    let f: pkgb.Frame<Int64> = pkgb.Frame<Int64>(3, 4)
    if (f.area() != 3 || f.labelOf() != "frame") {
        return 11
    }
    let lamp: pkgb.Lamp = pkgb.Lamp()
    if (lamp.glow()) {
        return 12
    }
    lamp.toggle()
    if (!lamp.glow()) {
        return 13
    }
    if (pkgb.slotValue(pkgb.Slot.Full(8)) != 8) {
        return 14
    }
    return 0
}

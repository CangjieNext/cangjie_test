// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 场景：std.reflect 直接依赖 + 不带 --disable-reflection + ThinLTO（2x2 第 4 象限 thin 变体）
// 预期：完全不触发裁剪 —— 不透传 --cj-disable-lto-reflection、反射元数据完整保留
//       （method0 在、reflect 未降级 .dbg）、反射 API 运行正常
// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=thin %f libpkgs.bc libpkga.bc libpkgb.bc -o %output -V 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: regex (llvm-link|llvm-lto|opt|lld)
// (target_linux | target_android | target_ohos) ASSERT: scan-not --cj-disable-lto-reflection
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | grep "pkgs:Data.tt.method0"
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | grep "pkgs:Data.tt.fieldnames"
// (target_linux | target_android | target_ohos) EXEC-1: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | grep "pkgs:Data.tt.reflect.dbg"
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

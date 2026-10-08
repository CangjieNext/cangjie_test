// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 场景：dylib 产物 — 不带 --disable-reflection 对照组
// 验证点：dylib 构建时不带裁剪开关 → 导入库反射完整保留
//   1) .so：method0 保留、reflect 未降级（无 .dbg）
//   2) exe 链接该 .so 运行正常
// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj lib.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full -O2 lib.cj libpkgs.bc libpkga.bc libpkgb.bc --output-type=dylib -o libctrl.%dylib_suffix
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t libctrl.%dylib_suffix 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Data.tt.method0
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Data.tt.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgs:Data.tt.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:Box3.tt.method0
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgb:Box3.tt.reflect.dbg
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %f -L. -lctrl -o %output
// (target_linux | target_android | target_ohos) RUN-EXEC: %run %run_opt %output %run_args

package tmp_test

import lib
import pkgb

main(): Int64 {
    return run()
}

func run(): Int64 {
    let data1: lib.Wrapped = lib.makeWrapped(3, 4)
    if (data1.area() != 3) {
        return 1
    }
    if (data1.summary() != "pkgs-origin#1") {
        return 2
    }
    if (lib.boxVolume() != 6) {
        return 3
    }
    if (lib.modeValue(pkgb.Mode.On(9)) != 9) {
        return 4
    }
    return 0
}

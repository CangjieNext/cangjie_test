// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 场景：--disable-reflection + LTO 产物为 dylib（动态库）
// 验证点：
//   1) dylib 走完整 LTO post-link 管线 → CJDisableImportLibReflection pass 运行，
//      链接进 dylib 的导入库（pkgs/pkga/pkgb）反射元数据被裁剪：
//      fieldnames 保留、method0 消失、reflect 降级 .dbg
//   2) 对照 dylib（不带开关）method0 完整保留、reflect 未降级
//   3) 裁剪 dylib 体积 < 对照 dylib 体积
//   4) 链式影响：下游 exe 链接裁剪后的 dylib，运行功能不受影响
// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj lib.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full -O2 --disable-reflection lib.cj libpkgs.bc libpkga.bc libpkgb.bc --output-type=dylib -o libtrim.%dylib_suffix
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full -O2 lib.cj libpkgs.bc libpkga.bc libpkgb.bc --output-type=dylib -o libctrl.%dylib_suffix
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t libtrim.%dylib_suffix 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Data.tt.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Data.tt.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgs:Data.tt.method0
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:Box3.tt.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:Box3.tt.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgb:Box3.tt.method0
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t libctrl.%dylib_suffix 2>&1 | grep "pkgs:Data.tt.method0"
// (target_linux | target_android | target_ohos) EXEC-1: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t libctrl.%dylib_suffix 2>&1 | grep "pkgs:Data.tt.reflect.dbg"
// (target_linux | target_android | target_ohos) EXEC: test $(stat -c %s libtrim.%dylib_suffix) -lt $(stat -c %s libctrl.%dylib_suffix)
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %f -L. -ltrim -o %output
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
    if (!data1.isOrigin()) {
        return 3
    }
    if (lib.bump() != 1 || lib.bump() != 2) {
        return 4
    }
    if (lib.boxVolume() != 6) {
        return 5
    }
    if (lib.modeValue(pkgb.Mode.On(9)) != 9) {
        return 6
    }
    return 0
}

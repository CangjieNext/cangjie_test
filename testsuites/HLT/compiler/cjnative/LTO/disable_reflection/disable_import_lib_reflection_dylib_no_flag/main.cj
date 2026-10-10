// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 场景：dylib 产物 — std.reflect 豁免（dylib 链接了 std.reflect 时不裁剪）
// 验证点：lib.cj import std.reflect 并使用 TypeInfo.of → 驱动 LinksStdReflect 命中
//   1) -V 输出走 LTO 链路但不透传 --cj-disable-lto-reflection
//   2) 裁剪 .so（带开关）与对照 .so 符号一致：method0 均保留、reflect 均未降级
//   3) 裁剪 .so 体积 <= 对照 .so 体积（豁免不裁，但带开关可能有微小差异）
//   4) exe 链接后反射 API 运行正常
// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj libreflect.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full -O2 --disable-reflection libreflect.cj libpkgs.bc libpkga.bc libpkgb.bc --output-type=dylib -o libtrim.%dylib_suffix -V 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: regex (llvm-link|llvm-lto|opt|lld)
// (target_linux | target_android | target_ohos) ASSERT: scan-not --cj-disable-lto-reflection
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full -O2 libreflect.cj libpkgs.bc libpkga.bc libpkgb.bc --output-type=dylib -o libctrl.%dylib_suffix
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t libtrim.%dylib_suffix 2>&1 | grep "pkgs:Data.tt.method0"
// (target_linux | target_android | target_ohos) EXEC-1: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t libtrim.%dylib_suffix 2>&1 | grep "pkgs:Data.tt.reflect.dbg"
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t libctrl.%dylib_suffix 2>&1 | grep "pkgs:Data.tt.method0"
// (target_linux | target_android | target_ohos) EXEC-1: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t libctrl.%dylib_suffix 2>&1 | grep "pkgs:Data.tt.reflect.dbg"
// (target_linux | target_android | target_ohos) EXEC: test $(stat -c %s libtrim.%dylib_suffix) -le $(stat -c %s libctrl.%dylib_suffix)
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %f -L. -ltrim -o %output
// (target_linux | target_android | target_ohos) RUN-EXEC: %run %run_opt %output %run_args

package tmp_test

import libreflect

main(): Int64 {
    let name = libreflect.reflectName()
    if (name.isEmpty()) {
        return 1
    }
    if (!libreflect.reflectAll()) {
        return 2
    }
    let data1: libreflect.Wrapped = libreflect.makeWrapped(3, 4)
    if (data1.area() != 3) {
        return 3
    }
    if (libreflect.boxVolume() != 6) {
        return 4
    }
    return 0
}

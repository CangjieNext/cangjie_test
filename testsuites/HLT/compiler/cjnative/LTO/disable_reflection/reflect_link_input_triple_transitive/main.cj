// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 场景：--disable-reflection + 三层传递反射依赖抑制
// 验证点：
//   1) 三层库（pkga / pkgb / pkgs）作为链接输入，pkgs 直接 import std.reflect
//   2) 编译器在链接扫描时检测到 libpkgs.bc 的模块依赖 → 抑制 --cj-disable-lto-reflection
//   3) 反言之，尽管 --disable-reflection 已传，反射信息因传递依赖被保留
//   4) LTO post-link 管线正常启动（llvm-link / llvm-lto / opt / lld）
//   5) 运行时反射 API（TypeInfo.of）功能正常 + 各库业务逻辑正确
// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full --disable-reflection %f libpkga.bc libpkgb.bc libpkgs.bc -o %output -V 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: regex (llvm-link|llvm-lto|opt|lld)
// (target_linux | target_android | target_ohos) ASSERT: scan-not --cj-disable-lto-reflection
// (target_linux | target_android | target_ohos) RUN-EXEC: %run %run_opt %output %run_args

package tmp_test

import pkga
import pkgb
import pkgs

main(): Int64 {
    // pkgs 层：直接使用 std.reflect（TypeInfo.of）
    let n1 = pkgs.typeNameOfInt()
    let n2 = pkgs.typeNameOfFloat()
    if (n1.isEmpty() || n2.isEmpty()) {
        return 1
    }
    let d: pkgs.Data = pkgs.Data(3, 4)
    if (d.area() != 12) {
        return 2
    }
    // pkgb 层：三层库之一
    var bx: pkgb.Box3<Int64> = pkgb.Box3<Int64>(1, 2, 3, 0)
    if (bx.volume() != 6) {
        return 3
    }
    if (pkgb.modeValue(pkgb.Mode.On(9)) != 9) {
        return 4
    }
    // pkga 层：三层库之一
    let tg = pkga.Tagged()
    if (tg.name() != "tagged") {
        return 5
    }
    if (tg.bump() != 1 || tg.bump() != 2) {
        return 6
    }
    return 0
}
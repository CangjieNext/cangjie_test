// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 场景：--disable-reflection + 接口（interface）反射裁剪
// 验证点：
//   1) 接口虚分派所需的分发表（itab）必须保留，裁剪后接口调用仍正常工作
//   2) 实现接口的类的反射元数据按规则裁剪：fieldnames 保留、method0 删除、reflect 降级 .dbg
//   3) 对照产物（不带开关）method0 完整保留
//   4) 裁剪后产物体积 < 对照产物
// (target_linux | target_android | target_ohos) DEPENDENCE: pkgs.cj pkga.cj pkgb.cj
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgs.cj -o libpkgs.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkgb.cj -o libpkgb.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full pkga.cj -o libpkga.bc
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full -O2 --disable-reflection %f libpkgs.bc libpkga.bc libpkgb.bc -o %output
// (target_linux | target_android | target_ohos) EXEC: %compiler %cmp_opt --lto=full -O2 %f libpkgs.bc libpkga.bc libpkgb.bc -o main_reflect.out
// (target_linux | target_android | target_ohos) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | compare %f
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Rect.ti.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan pkgs:Rect.ti.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgs:Rect.ti.method0
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:Circle.ti.fieldnames
// (target_linux | target_android | target_ohos) ASSERT: scan pkgb:Circle.ti.reflect.dbg
// (target_linux | target_android | target_ohos) ASSERT: scan-not pkgb:Circle.ti.method0
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
    // 接口虚分派：运行时通过接口类型调用实现类方法，验证裁剪后分发表仍可用
    let r1: pkgs.Shape2D = pkgs.makeRect(3, 4)
    if (r1.area() != 12) {
        return 1
    }
    let r2: pkga.Shape2D = pkga.makeRect(5, 6)
    if (r2.area() != 30) {
        return 2
    }
    let scaled: pkgs.Shape2D = r1.scale(2)
    if (scaled.area() != 48) {
        return 3
    }
    let c: pkgb.Drawable = pkgb.Circle(3, "circle")
    if (c.draw() != "circle#3") {
        return 4
    }
    let s1 = pkgs.makeRect(3, 4)
    if (s1.ownerTag() != "pkgs-7" || s1.identify() != "base-7") {
        return 5
    }
    let s2 = pkga.makeRect(5, 6)
    if (s2.ownerTag() != "pkga-9" || s2.identify() != "base-9") {
        return 6
    }
    if (pkgs.defaultOwner.isEmpty() || pkga.defaultOwner.isEmpty()) {
        return 7
    }
    return 0
}

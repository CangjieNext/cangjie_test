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
    let e = keepEnum(pkga.E.A(3))
    let opt = wrapEnum(e)
    let unwrapped = match (opt) {
        case Some(v) => v
        case None => return 2
    }
    if (pkgs.tagE(pkgs.E.A) != 1 || pkga.tagEa(unwrapped) != 3) {
        return 1
    }
    if (pkgs.tagF(pkgs.F.A(7)) != 3) {
        return 3
    }
    if (pkgs.useEnum(pkgs.makeB(5)) != 105) {
        return 4
    }
    if (pkgb.gValue(pkgb.G.B(7)) != 7) {
        return 5
    }
    return 0
}

public func keepEnum(e: pkga.E): pkga.E {
    return e
}

public func wrapEnum(e: pkga.E): Option<pkga.E> {
    return Some(e)
}

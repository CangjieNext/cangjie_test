// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// dylib variant of the import-lib reflection cut at -O2. The imported
// packageInfo globals survive into the LTO post-link module, so
// CJDisableImportLibReflection clears their FPT_FLAG while keeping layout.
// (Linux and CJNATIVE) DEPENDENCE: ../pkgs ../pkga
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt pkgs/pkgs.cj --lto=full --output-type=staticlib
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt pkga/pkga.cj --lto=full --output-type=staticlib

// Flagged dylib -> %output; control dylib (no flag) -> main_reflect.%dylib_suffix.
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %enableO2 %f -o %output --lto=full --disable-reflection --output-type=dylib libpkgs.bc libpkga.bc
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %enableO2 %f -o main_reflect.%dylib_suffix --lto=full --output-type=dylib libpkgs.bc libpkga.bc

// The flagged dylib must keep the imported packageInfo layout and the .dbg
// payload, while dropping method reflection.
// (Linux and CJNATIVE) EXEC-PIPE: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan pkgs_pkgs.packageInfo
// (Linux and CJNATIVE) ASSERT: scan pkga_pkga.packageInfo
// (Linux and CJNATIVE) ASSERT: scan pkgs:Data.tt.fieldnames
// (Linux and CJNATIVE) ASSERT: scan pkgs:Data.tt.reflect.dbg
// (Linux and CJNATIVE) ASSERT: scan-not pkgs:Data.tt.method0

// Final stage: size comparison (all links already done).
// (Linux and CJNATIVE) EXEC: test $(stat -c %s %output) -lt $(stat -c %s main_reflect.%dylib_suffix)

import pkgs
import pkga

// A dylib has no executable main entry; expose a public function instead so
// the imported types remain reachable from this module.
public func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: pkgs.Data<Int32> = pkgs.Data<Int32>(a, b)
    let data2: pkga.Data<Int32> = pkga.Data<Int32>(b, a)
    var res1: Int32 = data1.area()
    var res2: Int32 = data2.area()
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

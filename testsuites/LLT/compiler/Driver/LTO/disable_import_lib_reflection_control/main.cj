// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Control side of the LTO reflection cut: linking WITHOUT --disable-reflection
// must NOT run CJDisableImportLibReflection, so the final binary keeps full
// imported-lib reflection (method0 present, reflect global NOT downgraded to
// .dbg). Existing tests only size-compare main_reflect.out; this pins the
// control's symbol state. O0 keeps every symbol stable.
// (Linux and CJNATIVE) DEPENDENCE: pkgs pkga
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt pkgs/pkgs.cj --lto=full --output-type=staticlib
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt pkga/pkga.cj --lto=full --output-type=staticlib
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full libpkgs.bc libpkga.bc
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// (Linux and CJNATIVE) EXEC-PIPE: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan pkgs:Data.tt.method0
// (Linux and CJNATIVE) ASSERT: scan pkgs:Data.tt.fieldnames
// (Linux and CJNATIVE) ASSERT: scan-not pkgs:Data.tt.reflect.dbg

import pkgs
import pkga

main(): Int64 {
    return run()
}

func run(): Int64 {
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

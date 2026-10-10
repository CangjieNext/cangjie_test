// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Shared import libs are compiled once, normally (they carry full reflection
// metadata). --disable-reflection goes on the main link only, so the backend
// pass cuts the imported-lib reflection at post-link.
// (Linux and CJNATIVE) DEPENDENCE: ../pkgs ../pkga
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt pkgs/pkgs.cj --lto=full --output-type=staticlib
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt pkga/pkga.cj --lto=full --output-type=staticlib

// Flagged link -> %output; control link (no flag) -> main_reflect.out.
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full --disable-reflection libpkgs.bc libpkga.bc
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o main_reflect.out --lto=full libpkgs.bc libpkga.bc

// The flagged binary must still run correctly.
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

// Symbol guard on the flagged binary: fieldnames kept, the reflect global is
// downgraded to .dbg, and method reflection must be gone. NOTE: scan is
// substring matching, NOT regex — no escaping/anchors.
// (Linux and CJNATIVE) EXEC-PIPE: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan pkgs:Data.tt.fieldnames
// (Linux and CJNATIVE) ASSERT: scan pkgs:Data.tt.reflect.dbg
// (Linux and CJNATIVE) ASSERT: scan-not pkgs:Data.tt.method0

// Final stage: size comparison (all links already done).
// (Linux and CJNATIVE) EXEC: test $(stat -c %s %output) -lt $(stat -c %s main_reflect.out)

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

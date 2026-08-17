// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Shared enum import libs are compiled once, normally (they carry full reflection
// metadata). --disable-reflection goes on the main link only, so the backend
// pass cuts the imported-lib reflection at post-link. %enableO2 exercises the
// -O2 path: the LTO post-link pipeline runs at --lto-O2.
// (Linux and CJNATIVE) DEPENDENCE: ../pkgs ../pkga
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt pkgs/pkgs.cj --lto=full --output-type=staticlib
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt pkga/pkga.cj --lto=full --output-type=staticlib

// Flagged link -> %output; control link (no flag) -> main_reflect.out.
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %enableO2 %f -o %output --lto=full --disable-reflection libpkgs.bc libpkga.bc
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %enableO2 %f -o main_reflect.out --lto=full libpkgs.bc libpkga.bc

// The flagged binary must still run correctly.
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

// Final stage: size comparison (all links already done).
// O2 full-LTO may fold enum reflection sub-symbols away, so only the size win and
// runtime behavior are stable oracles here.
// (Linux and CJNATIVE) EXEC: test $(stat -c %s %output) -lt $(stat -c %s main_reflect.out)

import pkgs
import pkga

main(): Int64 {
    let e1 = pkgs.E.A
    let e2 = pkga.E.A(3)
    if (e1.tag() != 1 || e2.tag() != 3) {
        return 1
    }

    return 0
}

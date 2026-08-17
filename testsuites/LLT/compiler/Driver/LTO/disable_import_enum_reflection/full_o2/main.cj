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

// Special full-LTO final-binary guard: imported enum sub-symbols are folded away,
// so use the Option wrapper that carries pkga.E through the program and assert the
// final binary still keeps stable std.core:Option metadata after reflection is cut.
// NOTE: scan is substring matching, NOT regex — no escaping/anchors.
// (Linux and CJNATIVE) EXEC-PIPE: $CANGJIE_HOME/third_party/llvm/bin/llvm-objdump -t %output 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan std.core:Option.tt.enumctors
// (Linux and CJNATIVE) ASSERT: scan std.core:Option.tt.reflect.dbg
// (Linux and CJNATIVE) ASSERT: scan-not std.core:Option.tt.method0

// Final stage: size comparison (all links already done).
// (Linux and CJNATIVE) EXEC: test $(stat -c %s %output) -lt $(stat -c %s main_reflect.out)

import pkgs
import pkga

main(): Int64 {
    let e = keepEnum(pkga.E.A(3))
    let opt = wrapEnum(e)
    let unwrapped = match (opt) {
        case Some(v) => v
        case None => return 2
    }
    if (pkgs.E.A.tag() != 1 || unwrapped.tag() != 3) {
        return 1
    }
    return 0
}

public func keepEnum(e: pkga.E): pkga.E {
    return e
}

public func wrapEnum(e: pkga.E): Option<pkga.E> {
    return Some(e)
}

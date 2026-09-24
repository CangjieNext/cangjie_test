// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for llvm-project issue #204: PEA must still promote a
// non-escaping finalizer, and ~init must run when a live may-throw call
// unwinds. -O2 runs PEA; --apc=1 keeps TypeInfo in-module;
// --int-overflow=wrapping lets PostOrderFunctionAttrs infer ~init nounwind;
// the arithmetic in work() keeps it from inlining into the try.
// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %overflowOpt %disableAPC %compile_lib_opt pkg/pkg.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt %enableO2 %overflowOpt %disableAPC %f pkg.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkg.*

var acq: Int64 = 0
var rel: Int64 = 0

class W {
    var h: Int64
    init() {
        acq += 1
        h = acq
    }
    ~init() {
        rel += 1
    }
}

func work(i: Int64): Int64 {
    let w = W()
    var acc = i
    acc = acc * 3 + 1
    acc = acc * 5 - 2
    acc = acc * 7 + 3
    acc = acc * 11 - 4
    return riskyUse(w.h, acc)
}

main() {
    let r1 = work(1)
    // Promotion happened: ~init ran synchronously (no GC wait).
    if (acq != 1 || rel != 1 || r1 != 1416) {
        return 1
    }
    shouldThrow = true
    let before = rel
    var caught = false
    try {
        work(2)
    } catch (e: Exception) {
        caught = true
    }
    if (!caught) {
        return 2
    }
    // Unwind path also ran ~init; object is not a permanent leak.
    if (rel - before != 1 || acq != 2 || rel != 2) {
        return 3
    }
    return 0
}

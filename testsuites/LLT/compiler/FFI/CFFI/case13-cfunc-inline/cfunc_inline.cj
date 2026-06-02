// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// (CJNATIVE and Linux) EXEC: %compiler %cmp_opt %f --lto=full  --fchir-function-inlining -o %output
// (Windows) EXEC: %compiler %cmp_opt %f --fchir-function-inlining -o %output
// (CJNATIVE and Linux) RUN-EXEC: %run %run_opt %output %run_args
// (Windows) RUN-EXEC: %run %run_opt %output %run_args

internal import std.convert.*

class A {
    var n: Int64

    init(i: Int64) { this.n = i
    }
}

main() {

    let f1: CFunc <() -> Unit >= { =>
        var a = A(Int64(Float64.tryParse(0.toString()).getOrThrow()))
        a.n + Int64(Float64.tryParse(1.toString()).getOrThrow())
    }
    unsafe {
        f1()
    }
}
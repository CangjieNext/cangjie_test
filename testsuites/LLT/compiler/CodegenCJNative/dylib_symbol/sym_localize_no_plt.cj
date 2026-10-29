// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Companion of sym_localize.cj. A localized symbol stays in the object file's .symtab, so it still
// shows up in `objdump -d` as the target of an intra package call. What must disappear is the PLT
// stub: calls to a package internal function are direct calls, not calls through a preemptible
// dynamic symbol.
//
// The objdump assertions live in their own case because compare.py parses every assertion written
// above the current `| compare %f` line. Keeping them here means the "scan-not helper" checks in
// sym_localize.cj are only ever applied to the readelf output they were written for.
// (Linux and CJNATIVE and x86) EXEC: %compiler --output-type=dylib %f -o lib%n.%dylib_suffix
// (Linux and CJNATIVE and x86) EXEC-PIPE: objdump -d lib%n.%dylib_suffix | compare %f
// (Linux and CJNATIVE and x86) ASSERT: scan _CN9symlocplt7helperAHl
// (Linux and CJNATIVE and x86) ASSERT: scan-not <_CN9symlocplt7helperAHl@plt>:
// (Linux and CJNATIVE and x86) ASSERT: scan _CN9symlocplt7helperBHl
// (Linux and CJNATIVE and x86) ASSERT: scan-not <_CN9symlocplt7helperBHl@plt>:

package symlocplt

func helperA(x: Int64): Int64 {
    return x * 3 + 1
}

func helperB(x: Int64): Int64 {
    return helperA(x) + helperA(x + 1)
}

public func api1(x: Int64): Int64 {
    return helperB(x) + helperB(x * 2)
}

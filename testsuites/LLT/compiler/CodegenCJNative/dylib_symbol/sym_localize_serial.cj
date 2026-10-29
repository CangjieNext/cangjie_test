// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Same expectation as sym_localize.cj, but with a single code generation module (`-j1`). In that mode
// there is no partial link step, so the driver has to localize the symbols of the object file it
// generated directly, see Gnu::ProcessGeneration.
// (Linux and CJNATIVE and x86) EXEC: cjc -j1 --output-type=dylib %f -o lib%n.%dylib_suffix
// (Linux and CJNATIVE and x86) EXEC-PIPE: readelf --dyn-syms -W lib%n.%dylib_suffix | compare %f
// (Linux and CJNATIVE and x86) ASSERT: scan _CN7symlocs4api1Hl
// (Linux and CJNATIVE and x86) ASSERT: scan-not _CN7symlocs7helperAHl
// (Linux and CJNATIVE and x86) ASSERT: scan-not _CN7symlocs7helperBHl

package symlocs

func helperA(x: Int64): Int64 {
    return x * 3 + 1
}

func helperB(x: Int64): Int64 {
    return helperA(x) + helperA(x + 1)
}

public func api1(x: Int64): Int64 {
    return helperB(x) + helperB(x * 2)
}

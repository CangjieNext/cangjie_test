// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A package internal function is not part of the ABI of a shared library. It gets a local binding in
// the generated object file, so the intra package calls are resolved directly and the symbol does not
// reach the dynamic symbol table where another DSO could preempt it.
// (Linux and CJNATIVE and x86) EXEC: %compiler --output-type=dylib %f -o lib%n.%dylib_suffix
// (Linux and CJNATIVE and x86) EXEC-PIPE: readelf --dyn-syms -W lib%n.%dylib_suffix | compare %f
// (Linux and CJNATIVE and x86) ASSERT: scan _CN6symloc4api1Hl
// (Linux and CJNATIVE and x86) ASSERT: scan-not _CN6symloc7helperAHl
// (Linux and CJNATIVE and x86) ASSERT: scan-not _CN6symloc7helperBHl


package symloc

func helperA(x: Int64): Int64 {
    return x * 3 + 1
}

func helperB(x: Int64): Int64 {
    return helperA(x) + helperA(x + 1)
}

public func api1(x: Int64): Int64 {
    return helperB(x) + helperB(x * 2)
}

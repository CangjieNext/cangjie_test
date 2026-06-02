// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./fn.cpp
// EXEC: %clang %clang_shared_opt fn.cpp -o %cffi_output %cffi_std_link
// EXEC: %compiler %cmp_opt %cffi-link %cffi_std_link %f -o %output
// EXEC-PIPE-1: %pwd_to_ld_path %run %output 2>&1 %run_args | compare %f
// ASSERT: regex Context::initmainAn exception has occurred:[\w\W]Exception: Hello CJC[\w\W]*atexit_08_C.cj:39[\w\W]*fn1_cjfn1

internal import std.process.*
internal import std.fs.*

foreign func fn1(): Unit

func printToStderr(str: String) {
    eprint(str, flush: true)
}

func fn1_cj() {
    printToStderr("fn1_cj")
    unsafe { fn1() }
}

var context: Context = Context()

class Context {
    init() {
        printToStderr("Context::init")
        Process.current.atExit(fn1_cj)
    }
}

main() {
    printToStderr("main")
    if (true) {
        throw Exception("Hello CJC")
    }
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./fn2.cpp
// EXEC: %clang %clang_shared_opt fn2.cpp -o %cffi_output %cffi_std_link
// EXEC: %compiler %cmp_opt %cffi-link %cffi_std_link %f -o %output
// EXEC-PIPE-1: %pwd_to_ld_path %run %output 2>&1 %run_args | compare %f
// ASSERT: regex initmainAn exception has occurred:[\w\W]Exception: Hello CJC[\w\W]*atexit_10_C_Exception.cj:45[\w\W]*fn1_cjmyCallbackAn exception has occurred:[\w\W]Exception: myCallback::Exception[\w\W]*atexit_10_C_Exception.cj:25

internal import std.process.*
internal import std.fs.*

func printToStderr(str: String) {
    eprint(str, flush: true)
}

foreign func set_callback(cb: CFunc<(Int32) -> Unit>): Unit

@C
func myCallback(s: Int32): Unit {
    printToStderr("myCallback")
    throw Exception("myCallback::Exception")
}

func fn1_cj() {
    printToStderr("fn1_cj")
    unsafe { set_callback(myCallback) }
}

var context: Context = Context()

class Context {
    init() {
        printToStderr("init")
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

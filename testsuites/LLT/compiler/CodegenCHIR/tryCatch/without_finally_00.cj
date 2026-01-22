// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// EXEC-PIPE-1: %set_stdx_path %run %run_opt %output %run_args 2>&1| compare %f

internal import stdx.crypto.crypto.*

func foo() {
    eprintln("foo")
    throw Exception()
}

func goo() {
    eprintln("goo")
    return 2
}

var x = try {
    foo()
} catch (e: SecureRandomException) {
    eprintln("got SecureRandomException")
    goo()
}

main() {
    eprintln("x=${x}")
    println("sdssssssssssssssssssssss")
    return 0
}

/* SCAN-IN
foo
An exception has occurred:
Exception
	 at default::foo(
*/

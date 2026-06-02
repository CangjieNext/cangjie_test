// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1| compare %f

class R <: Resource {
    public func isClosed(): Bool {
        eprintln("R::isClosed()")
        return false
    }

    public func close(): Unit {
        eprintln("R::close()")
    }
}

func foo() {
    eprintln("foo")
    throw Exception()
}

main() {
    try (r = R()) {
        foo()
    } catch (e: Exception) {
        eprintln("got Exception")
    }
    return 0
}

/* SCAN-IN
foo
R::isClosed()
R::close()
got Exception
 */

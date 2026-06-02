/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// (not g)RUN-EXEC: %run %run_opt %output %run_args
// (g)RUN-EXEC: %run %run_opt %output %run_args 

class C {
    var p: CString

    init(s: String) {
        p = unsafe { LibC.mallocCString(s) }
        println(s)
    }

    @When[!debug]
    ~init() {
        println("this is not debug")
        unsafe { LibC.free(p) }
    }

    @When[debug]
    ~init() {
        println("this is debug")
        unsafe { LibC.free(p) }
    }
}

main() {
    return 0
}

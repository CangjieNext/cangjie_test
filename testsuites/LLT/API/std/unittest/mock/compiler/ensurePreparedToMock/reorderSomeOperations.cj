/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -Woff=all --mock=on %f -o %output 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1
// ASSERT: scan cccbbb

class C {
    public var c : Int64 = 1
    public init() {
        print("ccc")
    }
}

class B {
    public var b : Int64 = 1
    public init(){
        print("bbb")
    }
}

main() {
    B().b = C().c
    println()
    return 0
}

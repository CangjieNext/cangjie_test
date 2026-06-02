// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %f 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan _CNatXa8toStringHv
// (not CJNATIVE)  ASSERT: scan _ZN8std.core6Extend4Int88toStringEv
// (CJNATIVE) ASSERT: regex _CN7defaultXa3fooHv
// (not CJNATIVE)  ASSERT: regex _ZN7default6Extend4Int83fooEv
// (CJNATIVE) ASSERT: regex _CN7defaultXa3fooHvE3barHv
// (not CJNATIVE)  ASSERT: regex _ZN7default4Int83foo3barS11[\d\w]{11}E
// (CJNATIVE) ASSERT: regex _CN7defaultXa3aaaIG_Hv
// (not CJNATIVE)  ASSERT: regex _ZN6Extend7default4Int83aaaIlEv
// (CJNATIVE) ASSERT: regex _CN7defaultXa3aaaIG_HvE3bbbIG0_Hv
// (not CJNATIVE)  ASSERT: regex _ZN7default4Int83aaaIl3bbbIlS11[\d\w]{11}Ev
// (CJNATIVE) ASSERT: regex _CN7defaultXa3aaaIG_HvE3bbbIG0_HvE3cccIG1_Hv
// (not CJNATIVE)  ASSERT: regex _ZN7default4Int83aaaIl3bbbIl3cccIlS15[\d\w]{15}Ev

// extend class and nested decls
// aaa::bbb::ccc

extend Int8 {
    func foo() {
        func bar() {
            return "bar"
        }
        bar()
        return "foo"
    }

    func aaa<T>() {
        func bbb<T>() {
            func ccc<T>() {
            }
            ccc<Int64>()
        }
        bbb<Int64>()
    }
}

main() {
    var zero = Int8(0).toString()
    println(zero)
    Int8(0).foo()
    println(Int8(0).aaa<Int64>())
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %f 2>&1 | compare %f
// (not CJNATIVE) ASSERT: regex _ZN7default1AE
// (not CJNATIVE) ASSERT: regex _ZN7default1A4baseEv
// (not CJNATIVE) ASSERT: regex _ZN7default6Extend1A3fooEv
// (not CJNATIVE) ASSERT: regex _ZN7default1A3foo3barS11[\d\w]{11}E
// (CJNATIVE) ASSERT: regex _CN7default1A4baseHv
// (CJNATIVE) ASSERT: regex _CN7defaultXCNY_1AE3fooHv
// (CJNATIVE) ASSERT: regex _CN7defaultXCNY_1AE3fooHvE3barHv
// (CJNATIVE) ASSERT: regex _CN7defaultXCNY_1AE3aaaIG_Hv
// (not CJNATIVE)  ASSERT: regex _ZN6Extend7default1A3aaaIlEv
// (CJNATIVE) ASSERT: regex _CN7defaultXCNY_1AE3aaaIG_HvE3bbbIG0_Hv
// (not CJNATIVE)  ASSERT: regex _ZN7default1A3aaaIl3bbbIlS11[\d\w]{11}Ev
// (CJNATIVE) ASSERT: regex _CN7defaultXCNY_1AE3aaaIG_HvE3bbbIG0_HvE3cccIG1_Hv
// (not CJNATIVE)  ASSERT: regex _ZN7default1A3aaaIl3bbbIl3cccIlS15[\d\w]{15}Ev

// extend class and nested decls
// aaa::bbb::ccc

class A {
    func base() {
        println("base")
    }
}

extend A {
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
    A().base()
    println(A().foo())
    println(A().aaa<Int64>())
    return 0
}

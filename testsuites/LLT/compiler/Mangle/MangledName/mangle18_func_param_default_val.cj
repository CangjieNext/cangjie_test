// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %f 2>&1 | compare %f
// (CJNATIVE)ASSERT: scan _CPI7default3fooHlCNY_1AERNat6StringEE1bHl
// (not CJNATIVE)ASSERT: scan _ZN7default3fooElC_ZN7default1AERrecord._ZN8std.core6StringE$b_1l
// (CJNATIVE)ASSERT: scan _CPI7default3fooHlCNY_1AERNat6StringEE1cHlY2_
// (not CJNATIVE)ASSERT: scan _ZN7default3fooElC_ZN7default1AERrecord._ZN8std.core6StringE$c_2lC_ZN7default1AE
// (CJNATIVE) ASSERT: scan _CPI7default3barHlCNY_1AEE1bHl
// (CJNATIVE) ASSERT: scan _CPI7default3bazHCNY_1AEE1aHv
// (not CJNATIVE) ASSERT: scan _ZN7default3barElC_ZN7default1AE$b_1l
// (not CJNATIVE) ASSERT: scan _ZN7default3bazEC_ZN7default1AE$a_0v

// default param desugared as funcDecl mangling

class A {
    var val = "class A"
}

func foo(a: Int64, b!: A = A(), c!: String = "") {
    println(a)
    println(b.val)
    println(c)
}

func bar(a: Int64, b!: A = A()): Int32 {
    println(a)
    println(b.val)
    0
}

func baz(a!: A = A()): Int64 {
    println(a.val)
    0
}

main() {
    foo(0)
    bar(0)
    baz()
    return 0
}

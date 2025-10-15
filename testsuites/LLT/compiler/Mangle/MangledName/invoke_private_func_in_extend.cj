// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --int-overflow=wrapping --apc=1 %n.cj 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --int-overflow=wrapping %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal i64 @_CN7defaultXCNY_1AEU00000000oudMSK_3pppHv
// (CJNATIVE) ASSERT: scan define internal i64 @_CN7defaultXCNY_1AEU00000000oudMSK0_3pppHv
// (not CJNATIVE) ASSERT: scan define internal i64 @_ZN7default6Extend1A3pppS7a0b0a_aEv()
// (not CJNATIVE) ASSERT: scan define internal i64 @_ZN7default6Extend1A3pppS7a0c0a_aEv()

class A {
    public static var a: Int64 = 5
    A() {}
}

extend A {
    private static func ppp() {
        return 0
    }

    public static func foo() {
        return ppp()
    }
}

extend A {
    private static func ppp() {
        return a
    }

    public static func me() {
        return ppp()
    }
}

main(): Int64 {
    var res1: Int64 = A.me() - 5
    var res2: Int64 = A.foo()
    if (res1 == 0 && res2 == 0) {
        return 0
    }
    return -1
}

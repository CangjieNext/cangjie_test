// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0: %frontendCompiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chir | compare %f
// (CJNATIVE and not Windows and DEBUG_OPTION) ASSERT: scan Apply(ThisType: Class-_CN7default1CIG_E<Generic-_CN7default1CIG_E3barIG0_HvE1UE>&, Class-_CN7default1CIG_E<Generic-_CN7default1CIG_E3barIG0_HvE1UE>&::@_CN7default1CIG_E3fooHv : () -> Int64)

class C<T> {
    public static func foo() {
        return 1
    }
    func bar<U>() {
        return C<U>.foo
    } // here is Apply, not InvokeStatic
}

main(): Int64 {
    return 0
}

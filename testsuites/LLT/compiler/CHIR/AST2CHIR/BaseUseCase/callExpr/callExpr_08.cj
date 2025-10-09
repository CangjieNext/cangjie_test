// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0: %frontendCompiler %enableO2 %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR_Debug/[0-9]*\_AST\_CHIR.chir | compare %f
// (CJNATIVE and not Windows) ASSERT: scan Apply(ThisType: Class-_CN7default1AE&, @_CN7default11MyInterface4foo4Hv)
// (CJNATIVE and not Windows) ASSERT: scan Apply(ThisType: Class-_CN7default1AE&, Class-_CN7default1AE::@_CN7default1A4foo1Hv : () -> Int64)

public interface fatherInterface {
    static func foo1(): Int64
}

public interface MyInterface <: fatherInterface {
    static func foo3(): Int64 {
        foo1()
    }
    static func foo4(): Int64 {
        foo3()
    }
}

class A <: MyInterface {
    static func f(): Int64 {
        1
    }
    public static func foo1() {
        f()
    }
}

main() {
    if (A.foo4() == 2 && A.foo1() == 1) {
        return 0
    } else {
        return 1
    }
}

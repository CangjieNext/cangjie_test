// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0: %frontendCompiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0:  %cat %n\_CHIR_Debug/[0-9]*\_CreateVTableAndUpdateFuncCall.chir | compare %f
// (CJNATIVE and not Windows) ASSERT: scan @test: (Struct-_CNat6StringE) -> Unit(Int64) => @_CN7default3Foo4testHRNat6StringE
public open class Foo {
    public open func test(x: String): Int64 {
        return 1
    }
    public func test<T>(x: T): Int64 {
        return 0
    }
}

class Test {
    func case1() {
        if (Foo().test<String>("1") == 0 && Foo().test("1") == 1) {
            return 0
        }
        return 1
    }
}

main() {
    Test().case1()
}

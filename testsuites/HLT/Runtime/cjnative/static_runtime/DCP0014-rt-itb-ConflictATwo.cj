/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows and not MAC) EXEC: %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --static %overflow_wrapping %f -o %output
// (not Windows and not MAC) RUN-EXEC-PIPE: unset LD_LIBRARY_PATH && %output %run_args | compare %f
// ASSERT:scan method1 is invoked in InfdefaultMethod1 in class named Intf

interface Super {
    func method1(): String {
        print("method1 is invoked in Inf")
        return ""
    }
    func defaultMethod1(): String {
        print("defaultMethod1 in class named Intf")
        return "defaultMethod1 in class named Intf"
    }
}

class Test {
    public func test(intf: Super): String {
        intf.method1()
        intf.defaultMethod1()
    }
}

class App <: Super {}

main(): Int64 {
    let appObj: App = App()
    let testObj: Test = Test()
    testObj.test(appObj)
    return 0
}

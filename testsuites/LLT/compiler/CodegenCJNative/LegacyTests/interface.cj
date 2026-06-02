// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface TestInterface {
    func interfaceMethod(): Int32
}

open class BaseClass <: TestInterface {
    public func interfaceMethod(): Int32 {
        3000
    }
}

func interfaceTest(): Int32 {
    let obj: BaseClass = BaseClass()
    return obj.interfaceMethod()
}

func codegenUnitTest(): Int32 {
    return interfaceTest()
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 3000) {
        return 0
    } else {
        return -1
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface InterfaceA {
    func A(): Int32 {
        3000
    }
}

interface InterfaceB <: InterfaceA {
    func B(): Int32 {
        5000
    }
}

open class ClassA <: InterfaceB {}

func interfaceTest(): Int32 {
    let obj: ClassA = ClassA()
    let a: InterfaceB = obj
    return obj.A() + a.B()
}

func codegenUnitTest(): Int32 {
    return interfaceTest()
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 8000) {
        return 0
    } else {
        return -1
    }
}

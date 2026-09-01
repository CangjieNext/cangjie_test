// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Struct-_CN7default2CBIG_E<Class-_CNat3AnyE&>&->@_CN7default2CBIG_E6<init>Hv
// ASSERT: scan-not Invoke(Struct-_CN7default2CBIG_E<Class-_CNat3AnyE&>&->@_CN7default2CBIG_E6<init>Hv
// ASSERT: scan Apply(Class-_CN7default2CAIG_E<Class-_CNat3AnyE&>&->@_CN7default2CAIG_E6<init>Hv
// ASSERT: scan-not Invoke(Class-_CN7default2CAIG_E<Class-_CNat3AnyE&>&->@_CN7default2CAIG_E6<init>Hv

interface mySize {
    func getMySize(): Int64
}

class CA<T> <: mySize {
    public func getMySize(): Int64 {
        return 8
    }
}

struct CB<T> <: mySize {
    public func getMySize(): Int64 {
        return 10
    }
}

func doTest(args: CB<Any>) {
    if (let Some(list) <- (args as mySize)) {
        return list.getMySize()
    }
    return 0;
}

func doTest2(args: CA<Any>) {
    if (let Some(list) <- (args as mySize)) {
        return list.getMySize()
    }
    return 0;
}

main() {
    // no devirtualization happens
    if (doTest(CB<Any>()) != 10 || doTest2(CA<Any>()) != 8 ) {
        return 1
    }
    return 0
}
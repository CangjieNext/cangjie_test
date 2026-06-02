// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface TestInterface {
    func testMethod(): Int32
}

open class AncestorClass <: TestInterface {
    public func testMethod(): Int32 {
        return 1;
    }
}

class TestClass <: AncestorClass {}

func run(): Int32 {
    var testInterface = TestClass();
    if (testInterface.testMethod() != 1) {
        return 2;
    }
    return 0
}

main(): Int64 {
    if (run() == 0) {
        return 0
    }
    return 1
}

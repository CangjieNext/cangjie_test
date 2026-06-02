// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface Interface1 {
    func method1(): Int32
}

interface Interface2 {
    func method2(): Int32
}

interface GreatInterface <: Interface1 & Interface2 {
    func greatMethod(): Int32
}

class interfaces00301 <: GreatInterface {
    public func method1(): Int32 {
        return 1;
    }
    public func method2(): Int32 {
        return 2;
    }
    public func greatMethod(): Int32 {
        return 3;
    }
}

func run(): Int32 {
    var greatInterface = interfaces00301()
    if (greatInterface.method1() != 1) {
        return 2;
    }
    if (greatInterface.method2() != 2) {
        return 2;
    }
    if (greatInterface.greatMethod() != 3) {
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

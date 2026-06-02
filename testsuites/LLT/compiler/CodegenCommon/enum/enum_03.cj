// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f %overflowOpt %enableO2 -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan matched: valueOne

struct Struct_SSS {
    var var_aaa: (Enum_YJQ) = (Enum_YJQ.valueOne)
    public func foo() {
        var xxx: (Enum_YJQ) = var_aaa
        match (xxx) {
            case defaultValue => println("matched: defaultValue")
            case valueOne => println("matched: valueOne")
            case _ => println("mis-matched")
        }
        return 0
    }
}

enum Enum_YJQ {
    defaultValue
    | valueOne
    | enumValue_SSS(Struct_SSS)
}

main() {
    Struct_SSS().foo()
    0
}

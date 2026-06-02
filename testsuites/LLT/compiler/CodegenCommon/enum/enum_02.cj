// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f %overflowOpt -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan matched: None

struct Struct_SSS {
    var var_aaa: (Option<Struct_SSS>) = (Option<Struct_SSS>.None)
    public func foo() {
        var xxx: (Option<Struct_SSS>) = var_aaa
        match (xxx) {
            case None => println("matched: None")
            case Some(v) => println("matched: Some")
            case _ => println("mis-matched")
        }
        return 0
    }
}

main() {
    Struct_SSS().foo()
    0
}

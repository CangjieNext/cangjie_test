// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f %enableCompileDebug -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello Cangjie200

// TempEnum
enum TE<T> {
    A(T) | B(T, T) | C
}

func noo() {
    match ([Option<TE<Int64>>.Some(TE.A(100))][0]) {
        case None => println("Hello Cangjie100")
        case _ => println("Hello Cangjie200")
    }
}

main() {
    noo()
    return 0
}

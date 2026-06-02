// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f %enableCompileDebug -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello Cangjie200

// Option_T: CHIR 没有将 Field 优化为 GetElementRef
func goo<T>(x: T) {
    match ([Option<T>.Some(x)][0]) {
        case None => println("Hello Cangjie100")
        case _ => println("Hello Cangjie200")
    }
}

main() {
    goo<Int64>(100)
    return 0
}

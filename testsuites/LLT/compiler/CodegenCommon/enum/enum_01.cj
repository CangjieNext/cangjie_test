// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 10\n

enum MyEnum {
    E1(CFunc<(Int64) -> Int64>) | E2(CFunc<(Int64, Int64) -> Int64>)
}

main() {
    let lam: CFunc<(Int64, Int64) -> Int64> = {
        x: Int64, y: Int64 =>
        println(x + y);
        return x
    }
    var a = MyEnum.E2(lam)
    match (a) {
        case E1(x) => unsafe { x(1) }
        case E2(y) => unsafe { y(0, 10) }
    }
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

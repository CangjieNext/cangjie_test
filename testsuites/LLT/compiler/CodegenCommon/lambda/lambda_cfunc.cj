// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 33

func goo(x: (Int64) -> Int64) {
    x(1)
}

func goo(x: CFunc<(Int64) -> Int64>) {
    unsafe {
        x(2)
    }
}

main() {
    var foo = {x: Int64 => x + 10}
    var cf: CFunc<(Int64) -> Int64> = {x: Int64 => x + 20}
    var res = goo(foo) + goo(cf)
    println(res)
    0
}

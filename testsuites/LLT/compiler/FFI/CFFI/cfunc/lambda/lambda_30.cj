// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE: %run %output 2>&1 | compare %f

public type CallBackT = CFunc<(CPointer<Unit>, CPointer<Unit>) -> Unit>
let foo1: CallBackT = { instance, _ =>
    let opt = Some(1)
    println(opt?.toString())
}

let foo2: CallBackT = { instance, _ =>
    let opt = Some(1)
    println(match (opt) {
        case Some(v) => v.toString()
        case _ => ""
    })
}

main() {
    var null = CPointer<Unit>()
    unsafe {
        foo1(null, null)
        foo2(null, null)
    }
}

/* SCAN
Some(1)
1
*/

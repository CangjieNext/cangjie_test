// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: private_child.cj
// EXEC: %compiler %cmp_opt %f private_child.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

sealed interface PrivateRoot {}

class PrivateVisible <: PrivateRoot {}

func classifyPrivate(value: PrivateRoot): Int64 {
    match (value) {
        case _: PrivateVisible => 0
        case _ => 1
    }
}

main() {
    println(classifyPrivate(hiddenRoot()))
}

/* SCAN
1
*/

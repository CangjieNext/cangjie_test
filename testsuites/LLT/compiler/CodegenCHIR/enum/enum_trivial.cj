// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 2\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum COLOR {
    GREEN
    | BLUE
    | YELLOW
    | RED
}

main() {
    let x = COLOR.BLUE
    match (x) {
        case GREEN => println(1)
        case BLUE => println(2)
        case YELLOW => println(3)
        case RED => println(4)
    }
}

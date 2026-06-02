/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum Enum {
    EnumA
    | @Deprecated
    EnumB
    | @Deprecated EnumC(Bool)
}

func foo(e: Enum) {
    match (e) {
        case EnumA => ()
        case EnumB => ()
        case EnumC(false) => ()
        case _ => ()
    }
}

main() {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %f -o %output
// RUN-EXEC-0: %run %run_opt %output %run_args

func foo(): Rune {
    match (((Int32(100), 101), 102)) {
        case ((aaaa: Option<Unit>, _), _: Array<Unit>) => ()
        case _ => ()
    }
    r'a'
}

main(): Int64 {
    foo()
    return 0;
}

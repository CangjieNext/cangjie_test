/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args


var ch = r'仓'

func add(a: Rune): Rune {
    ch = a
    return ch
}

main(): Int64 {
    let fut1: Future<Rune> = spawn {
        add(r'颉')
        return r'仓'
        add(r'!')
    }
    sleep(Duration.second);
    if (ch != r'颉') {
        return 1
    }
    return 0
}

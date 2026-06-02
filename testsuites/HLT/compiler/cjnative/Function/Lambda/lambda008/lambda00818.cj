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

main(): Int64 {
    let aa = 0
    let f = {
        x, y => match (aa) {
            case 1 where x => 1
            case 0 where y == 1 => 2
            case _ => 3
        }
    }
    if (f is (Bool, Int64) -> Int64) {
        return 0
    }
    return 1
}

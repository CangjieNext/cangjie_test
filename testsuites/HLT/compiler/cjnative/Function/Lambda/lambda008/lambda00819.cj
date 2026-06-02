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
    let bbox = Box(aa)
    let f = {
        x, y => match (aa) {
            case 1 => bbox.value = x + 1
            case 0 =>
                if (y == 0u8) {
                    bbox.value = 100
                }
            case _ => ()
        }
    }
    if (f is (Int64, Byte) -> Unit) {
        return 0
    }
    return 1
}

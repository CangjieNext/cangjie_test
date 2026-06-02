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

main() {
    var v: Int64 = 1
    match (v) {
        case 0 => match (v) {
            case 0 => 1
            case 1 => true
            case _ => "not a valid score"
        }
        case 1 => match (v) {
            case 0 => Some(1)
            case 1 => Some(true)
            case _ => Some("not a valid score")
        }
        case _ => match (v) {
            case 0 => (1)
            case 1 => [true]
            case _ => ()
        }
    }
    return 0
}

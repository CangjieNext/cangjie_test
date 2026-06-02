/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    let score = "abc"
    let level = match (score) {
        case "abc" => "true"
        case "bca" => "false"
        case _ => "Not a valid score"
    }
    let x = 6.0
    let level2 = match (x) {
        case 6.0 => "true"
        case 5.0 => "false"
        case _ => "Not a valid score"
    }
    0
}

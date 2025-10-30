/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    let score : Float16 = 1.1
    let level = match (score) {
        case 1.1 => "C"
        case _ => "Not a valid score"
    }
}


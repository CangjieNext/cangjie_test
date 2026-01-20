/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    let score = ()
    let level = match {
        case score ==() => "true"
        case score != () => "false"
        case _ => "Not a valid score"
    }

    let score2 = ()
    let level2 = match(score2) {
        case () => "true"
        case _ => "Not a valid score"
    }
    0
}

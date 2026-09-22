/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func unicodeEscapes(): String {
    let a="\u{4E2D}\u{6587}"
    let b="emoji:\u{1F600}"
    let c="tab:\t newline:\n quote:\" backslash:\\"
    return a+b+c
}

main() {
    println(unicodeEscapes().size)
}

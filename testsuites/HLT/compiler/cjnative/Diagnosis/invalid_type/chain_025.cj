/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

var a = while (1) {
    1
}

main() {
    a++
    a--
    a **= 1
    a *= true
    a /= true
    a %= true
    a += true
    a -= true
    a <<= true
    a >>= true
    a &&= true
    a ||= true
    a &= true
    a ^= true
    a |= true

    return 1
}
// ASSERT: scan sema_cannot_convert_literal

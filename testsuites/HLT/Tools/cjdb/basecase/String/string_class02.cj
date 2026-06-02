/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C1<T> {
    var main_str7: String = "1 + 1"
    var main_str11: String = ##"This is a,
cangjie "#\n"##
    var main_str2: String = "012"
    var main_str3: String = "abc"
    var s2 = "\u{4f60}\u{597d}\u{4ed3}\u{9889}\u{ff01}"
    var main_str14: String = "${main_str2}${main_str3}"
    var b = 1
}

main() {
    var a1 = C1<Int64>()
    var a2 = a1.main_str2
    var a3 = a1.s2
    0
}

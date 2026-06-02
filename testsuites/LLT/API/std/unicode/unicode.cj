/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args
/*
 * Test description: Test the funcs for unicode.cj
 * Test API: extend Rune <: RuneMethod {
 *              public func isLowerCase(): Bool
 *              public func isUpperCase(): Bool
 *              public func isTitleCase(): Bool
 *              public func toUpperCase(): Rune
 *              public func toTitleCase(): Rune
 *          }
 *           extend String <: StringMethod {
 *              public func toTitle(): String
 *              public func isBlank(): Bool
 *              public func toUpper(): String
 *          }
 */

internal import std.unicode.*

main() {
    var a = r'A'
    var b = a.isLowerCase()
    if (b) {
        return 1
    }
    var c = a.isUpperCase()
    if (!c) {
        return 2
    }
    var d = a.isTitleCase()
    if (d) {
        return 3
    }
    var e = a.toUpperCase()
    if (e != r'A') {
        return 4
    }
    var f = a.toTitleCase()
    if (f != r'A') {
        return 5
    }
    var a43 = "Nihao huawei"
    var b43 = a43.isBlank()
    if (b43) {
        return 6
    }
    var a50 = "      "
    var b50 = a50.isBlank()
    if (!b50) {
        return 7
    }
    var huawei = a43.toUpper()
    if (huawei != "NIHAO HUAWEI") {
        return 8
    }
    var huawei1 = huawei.toUpper()
    if (huawei1 != "NIHAO HUAWEI") {
        return 9
    }
    var a69 = huawei1.toTitle()
    if (huawei1 != "NIHAO HUAWEI") {
        return 10
    }
    var a75 = a43.toTitle()
    if (a75 != "NIHAO HUAWEI") {
        return 11
    }
    return 0
}

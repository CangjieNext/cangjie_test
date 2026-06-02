// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj %f.expect
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt --debug-macro %f -o %output
// EXEC: %diff %f.expect %f.macrocall

import define.*
internal import std.unittest.*
import std.unittest.testmacro.*

@M0
var a = #"hello
    Cangjie"#

@M
var a1 = #"hello
    Cangjie"#

@M0
var b = """
    <showList color="blue">
        <file color='blue2' size="180">
            <name>Rain2</name>
            <date>2020-01-03</date>
        </file>
    </showList>
    """

@M
var b1 = """
    <showList color="blue">
        <file color='blue2' size="180">
            <name>Rain2</name>
            <date>2020-01-03</date>
        </file>
    </showList>
    """

@M0
let c = [r'\t', r'\r', r'\n', r'\u{0020}', r' ', r'\'']

@M0
let d = r'\''

main() {}

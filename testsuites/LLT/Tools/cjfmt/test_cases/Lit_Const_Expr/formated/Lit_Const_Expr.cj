// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

let a = r' '
let b = r'\u{0000}'
let s1 = ""
let s2 = "Hello Cangjie Lang"
let s3 = "\"Hello Cangjie Lang\""
let s4 = "Hello Cangjie Lang\n"
let s5 = """
"""
let s6 = """
This
    is a multi-line string"""
let s7 = """
    This
    is a multi-line string"""
let s8 = """
This
    is a
multi-line string
"""
let s9 = """
This is a
    multi-line string
"""
let s10 = #""#
let s11 = ##""##
let s12 = ##"
     This
   is a multi-line raw string"##
let s13 = #"This is a
    multi-line string"#
let s14 = """
<div style="background-color: #FFFFFF">
<style>h1{color: yellow;}</style>
<h1>This is a paragraph for testing</h1>
<p>a</p>
</div>"""
let s15 = 'xyz'
let s16 = '''
xyz
'''
let s17 = #'xyz'#

func test() {
    let ss = """
This is a
    multi-line string
"""
    let tt = ##"
    This
  is a multi-line raw string"##
}

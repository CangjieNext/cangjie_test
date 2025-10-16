/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

main(): Int64 {
    var map_1: HashMap<String, String> = HashMap<String, String>([('0', 'a'), ('1', 'b')])
    var map_2: HashMap<String, String> = HashMap<String, String>([("01", "a1"), ("11", 'b')])
    var map_3: HashMap<String, String> = HashMap<String, String>(
        [("""
    aaa
""", """
111
"""), ("bbb", """
222
""")])
    var map_4: HashMap<String, String> = HashMap<String, String>([(#"a"#, "1"), ("b", #"
    2"#)])
    0
}

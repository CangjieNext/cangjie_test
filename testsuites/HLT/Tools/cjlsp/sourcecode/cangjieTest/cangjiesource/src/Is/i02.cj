/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Is

func testi2() {
    let a = 1 is Int32
    Option<Int16>.Some(10) is Option<Int16>
    a is Int32
    1 + 2 is Int16
    1 is Int8
    1 is UInt8
    1.2 is Float16
    1.2 is Int8
    'a' is Char
    'a' is Int8
    true is Bool
    "Cangjie" is String
    () is Unit
    let range1 = [0..10 : 1] is Range<Int64>
    [0..10 : 1] is Range<Int64>
    ([1, 2]) is Array<Int64>
    ([[0, 1, 2], [3, 4, 5]]) is Array<Array<Int64>>
    let list1 = [1, 2, 3]
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func getArr(a: Int64, b: Array<Int16>): Array<Array<Int16>> {
    var arr: Array<Array<Int16>> = Array<Array<Int16>>(a, repeat: b)
    return arr
}

enum E {
    A | B | C
}

func getArr1(a: Int64, b: Array<E>): Array<Array<E>> {
    var arr: Array<Array<E>> = Array<Array<E>>(a, repeat: b)
    return arr
}

main() {
    0
}

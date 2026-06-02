// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj %compile_lib_opt

let f1 = {a: Int64, b: Int64 => a + b}

func test3(src: Array<Rune>): Array<UInt8> {
    return Array<UInt8>(5, {i => UInt8(UInt32(src[i]))})
}

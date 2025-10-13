let a = [Option<UInt64>.Some(18), 52.55555555555, -1, [[[[[[0]]]]]]]
main(): Int64 {
    return (a[3] as Array<Array<Array<Array<Array<Array<Int64>>>>>>).getOrThrow()[0][0][0][0][0][0]
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func foo<T>(a: T) {
    var b = a
}

main() {
    var a: Int32 = 1
    foo<Int32>(a)
    var b: Int8 = 2
    foo<Int8>(b)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

var var_aaa: (Int64, VArray<Int64, $4>) = (94, VArray<Int64, $4>(repeat: Int64(-6)))

main(): Int64 {
    println(var_aaa[1][0]);
    return 0;
}

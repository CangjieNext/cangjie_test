// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output

@CallingConv[CDECL]
foreign func foo1(): Unit

@CallingConv[CDECL]
foreign {
    func foo2(): Unit
    func foo3(): Unit
}

main() {}

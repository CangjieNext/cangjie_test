// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE and DEBUG_OPTION) DEPENDENCE: %n.chir
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output --dump-chil-debug
// (CJNATIVE and DEBUG_OPTION) EXEC: compare %n.chir < match_enum_ir_01_CHIR/0_AST_CHIR.chir

enum E {
    X(Int64) | Y
}

func foo(b: E) {
    match (b) {
        case X(a) => a
        case Y => 1
    }
    0
}

main() {
    foo(Y)
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %mkdir tmps
// EXEC: %compiler %cmp_opt %compile_lib_opt %disableAPC %f %save_temps_opt=tmps
// EXEC: %llvmDissembler tmps/%n.bc -o tmps/%n.ll
// EXEC-PIPE: %cat tmps/%n.ll 2>&1 | compare %f
// ASSERT: regex define void @_CN7default6calleeHv\(%"Tuple<Int64,Bool,Rune>"\* .* sret\(%"Tuple<Int64,Bool,Rune>"\) %0\)

func callee(): (Int64, Bool, Rune) {
    (1, true, r'e')
}

func caller() {
    let ret = callee()
    0
}

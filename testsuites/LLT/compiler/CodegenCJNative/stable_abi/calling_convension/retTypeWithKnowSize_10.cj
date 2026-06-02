// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %mkdir tmps
// EXEC: %compiler %cmp_opt %compile_lib_opt %disableAPC %f %save_temps_opt=tmps
// EXEC: %llvmDissembler tmps/%n.bc -o tmps/%n.ll
// EXEC-PIPE: %cat tmps/%n.ll 2>&1 | compare %f
// ASSERT: regex define void @_CN7default6calleeIG_Hv\(%"record\.default:SA<T>"\* .* sret\(%"record\.default:SA<T>"\) %0, %TypeInfo\* %ti\.T\)

struct SA<T> {
    let a = 1
    let b = 2
}

func callee<T>(): SA<T> {
    SA<T>()
}

func caller() {
    let res = callee<Int64>()
    0
}

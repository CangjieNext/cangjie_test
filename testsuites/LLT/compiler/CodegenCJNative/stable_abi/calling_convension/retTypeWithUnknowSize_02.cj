// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %mkdir tmps
// EXEC: %compiler %cmp_opt %compile_lib_opt %disableAPC %f %save_temps_opt=tmps
// EXEC: %llvmDissembler tmps/%n.bc -o tmps/%n.ll
// EXEC-PIPE: %cat tmps/%n.ll 2>&1 | compare %f
// ASSERT: regex define void @_CN7default6calleeIG_G0_HG_G0_\(i8 addrspace\(1\)\* .* sret\(i8\) %0, i8 addrspace\(1\)\* %x, i8 addrspace\(1\)\* %y, %TypeInfo\* %ti\.T1, %TypeInfo\* %ti\.T2\)

class CA<T> {
    CA(let x: T) {}
}

func callee<T1, T2>(x: T1, y: T2): (T1, Int32, CA<T2>) {
    (x, 1, CA<T2>(y))
}

func caller() {
    let res = callee<Int64, Bool>(1, true)
    0
}

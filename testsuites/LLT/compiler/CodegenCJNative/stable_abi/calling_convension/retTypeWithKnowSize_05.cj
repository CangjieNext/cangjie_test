// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %mkdir tmps
// EXEC: %compiler %cmp_opt %compile_lib_opt %disableAPC %f %save_temps_opt=tmps
// EXEC: %llvmDissembler tmps/%n.bc -o tmps/%n.ll
// EXEC-PIPE: %cat tmps/%n.ll 2>&1 | compare %f
// ASSERT: regex define void @_CN7default7callee1Hv\(%"enum\.default:Option_Like_Enum_1"\* .* sret\(%"enum\.default:Option_Like_Enum_1"\) %0\)
// ASSERT: regex define void @_CN7default7callee2Hv\(%"enum\.std\.core:Option<Int64>"\* .* sret\(%"enum\.std\.core:Option<Int64>"\) %0\)

struct MyStruct {
    MyStruct(private let _0: Bool, private let _1: Int64) {}
    static func null() {
        MyStruct(false, 0)
    }
}

enum Option_Like_Enum_1 {
    CASE1 | CASE2(MyStruct)
}

func callee1(): Option_Like_Enum_1 {
    Option_Like_Enum_1.CASE1
}

func callee2(): Option<Int64> {
    Option<Int64>.Some(1)
}

func caller() {
    let ret1 = callee1()
    let ret2 = callee2()
    0
}

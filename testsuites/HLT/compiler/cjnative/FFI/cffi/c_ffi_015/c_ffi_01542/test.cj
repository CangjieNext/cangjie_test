/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// ERRCHECK: %compiler %cmp_opt %ffic_opt -o %output

foreign func test(ptr: CPointer<Int64>): Int64

struct A {
    var a = 1

    func test() {
        unsafe {
            return test(inout a)
        }
    }
}

main(): Int64 {
    unsafe {
        return A().test()
    }
}
// ASSERT: scan sema_cannot_modify_var

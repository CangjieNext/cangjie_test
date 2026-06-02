/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

@C
struct Test1<T> {
    var a: T

    init(a: T) {
        this.a = a
    }
}

struct Test2<T> {
    var a: Test1<T>

    init(a: T) {
        this.a = Test1<T>(a)
    }
}

func test(): Unit {
    var a1 = Test1<Int64>(0)
    var a2 = Test2<String>("")
}

main() {
    test()
}
// ASSERT: scan sema_cffi_cannot_have_type_param
// ASSERT: scan sema_illegal_member_of_cstruct

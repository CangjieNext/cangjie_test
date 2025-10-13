/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    static func test<X>(a: Bool, b: Bool): Int64 {
        2
    }
}


func test(): Int64 {
    A<Bool>.test((return 0), (return 1))
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_unable_to_infer_generic_func

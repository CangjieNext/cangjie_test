/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
struct A<T> {}

foreign let a: A<Int32>
foreign var b: A<Int32> = A<Int32>()
foreign {
    var c: A<Int32>
    let d: A<Int32> = A<Int32>()
}
// ASSERT: scan sema_native_var_error

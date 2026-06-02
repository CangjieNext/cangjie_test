/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
interface A {}

class B <: A {}

foreign let a: A
foreign var b: A = B()
foreign {
    var c: A
    let d: A = B()
}
// ASSERT: scan sema_native_var_error

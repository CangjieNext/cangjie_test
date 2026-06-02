/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

foreign interface A {
    static func test(): Int64
}

foreign interface B {
    static func test(): Int64
}

var a = A.test()
var b = B.test()
// ASSERT: scan sema_unexpected_wrapper
// ASSERT: scan sema_unsafe_function_invoke_failed

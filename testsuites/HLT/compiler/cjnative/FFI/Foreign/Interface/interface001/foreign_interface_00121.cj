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
    func test(): Int64
}

foreign interface B {
    func test(): Int64
}

class C <: A {}

class D <: B {}

var a = C().test
var b = D().test
// ASSERT: scan sema_unexpected_wrapper

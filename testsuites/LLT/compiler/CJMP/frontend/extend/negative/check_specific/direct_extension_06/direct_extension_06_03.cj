// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %noColor --experimental %f --output-type=chir 2>&1 | compare %f
// ASSERT: scan error: expected '{', found '<:'
package cmp

class Foo<M, N> {}

common extend<T, G> Foo<T, G> where T <:ToString & G <: Hashable {}

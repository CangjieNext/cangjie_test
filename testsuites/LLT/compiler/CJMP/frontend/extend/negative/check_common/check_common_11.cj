// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-0: %compiler %cmp_opt --experimental --output-type=chir %f

package FOO

class Foo<M,N>{}

common extend<R,T> Foo<R,T> {}

common extend<R,T> Foo<R,T> {}

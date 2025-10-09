/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package frozen

import std.ast.*

//有诊断提示“xxx cannot be modified with '@Frozen’”，xxx根据被修饰元素的类型决定
@Frozen
public macro Foo(attrTokens: Tokens, inputTokens: Tokens): Tokens {
    return attrTokens + inputTokens // Concatenate attrTokens and inputTokens.
}

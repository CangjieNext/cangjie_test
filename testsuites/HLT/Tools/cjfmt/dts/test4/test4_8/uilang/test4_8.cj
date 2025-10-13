/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define
public macro Component(input: Tokens): Tokens {
    var varDecl = parseDecl(input)
    if (varDecl.hasAttr("State")) { // 如果该节点被标记了属性且值为 “State” 返回 true, 否则返回 false
        var attrs = varDecl.getAttrs() // 返回一组 Tokens
        println(attrs[0].value)
    }
    return input
}

@Component(
    @Attribute  [State] var cnt = 0
)
main() {}
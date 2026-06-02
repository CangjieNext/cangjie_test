// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    return quote(    let size = $(input).getIdentifier().value.size
        let name = $(input).getIdentifier().value.substring(0, size - 1)
        let $(attr) = Token(TokenKind.IDENTIFIER, name)
    )
}

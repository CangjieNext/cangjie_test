/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define

var a = @M[
    @sourceFile()
    ](@sourceFile())

func test(
    a!: String = @sourceFile(),
    b!: String = @sourceFile()
) {
    return a
}

public macro M(input: Tokens) {
    return quote(
        @sourceFile(
        )
        )
}

main() {
    var packageName = @sourceFile(

    )
    var b = [
        "1",
        "2",
        @sourceFile()
    ]
    var c = @sourceFile(
        1
    )
    var packageName1 = @M(
        @sourceFile()
    )
    @sourceFile(

    )
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define

var a = @M[
    @sourcePackage()
    ](@sourcePackage())

func test(
    a!: String = @sourcePackage(),
    b!: String = @sourcePackage()
) {
    return a
}

public macro M(input: Tokens) {
    return quote(
        @sourcePackage(
        )
        )
}

main() {
    var packageName = @sourcePackage(

    )
    var b = [
        "1",
        "2",
        @sourcePackage()
    ]
    var c = @sourcePackage(
        1
    )
    var packageName1 = @M(
        @sourcePackage()
    )
    @sourcePackage(

    )
}

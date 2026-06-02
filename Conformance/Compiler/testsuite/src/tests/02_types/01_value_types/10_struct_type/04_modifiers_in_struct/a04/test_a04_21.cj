/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_04_a04_21

  @Level:         1

  @Assertion:       2.1.10.4(4) Member variables defined within primary constructor can only be modified with
                    visibility modifiers (i.e. public or private, leaving it out is Default), not with the static
                    modifier.

  @Description:     Check that member variables of the primary constructor can be public and private inside one primary
                    constructor and a private variable is invisible outside the struct.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single
  @CompileWarning:  no

*/

struct S {
    S(public let a: Int64, private let b: Int64) {}
}

main() {
    S(0, 0).b
}

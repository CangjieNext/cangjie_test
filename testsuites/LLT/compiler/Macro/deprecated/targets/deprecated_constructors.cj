// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan constructor 'init' is deprecated.
// ASSERT: scan enum 'Enum' constructor 'EnumAConstructor' is deprecated.
// ASSERT: scan enum 'Enum' constructor 'EnumCConstructor' is deprecated.
// ASSERT: scan enum 'Enum' constructor 'EnumDConstructor' is deprecated. Use EnumBConstructor instead of this.
// ASSERT: scan constructor 'init' is deprecated.
// ASSERT: scan constructor 'init' is deprecated since 1999. It's too old.
// ASSERT: scan constructor 'init' is deprecated.

enum Enum {
    @Deprecated
    EnumAConstructor
    | EnumBConstructor
    | @Deprecated EnumCConstructor(Bool)
    | @Deprecated["Use EnumBConstructor instead of this"]
    EnumDConstructor
}

class Class {
    @Deprecated
    Class(private let str: String) {}

    @Deprecated["It's too old", strict: false, since: "1999"]
    init() {
        str = ""
    }
}

struct Struct {
    @Deprecated
    public init(x!: Bool = false) {
        let _ = x
    }

    init(_: String) {
        this(x: true)
    }
}

main(): Unit {
    let _ = EnumAConstructor
    let _ = EnumBConstructor
    let _ = Enum.EnumCConstructor(false)
    let _ = EnumDConstructor

    let _ = Class("string")
    let _ = Class()

    let _ = Struct()
    // Not deprecated
    let _ = Struct("sdfg")
}


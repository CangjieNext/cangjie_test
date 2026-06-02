// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan class 'Class' is deprecated.
// ASSERT: scan class 'Interface' is deprecated.
// ASSERT: scan class 'Struct' is deprecated.
// ASSERT: scan class 'Enum' is deprecated.
// ASSERT: scan class 'Class2' is deprecated. a too old.
// ASSERT: scan class 'Interface2' is deprecated. b too old.
// ASSERT: scan class 'Struct2' is deprecated. c too old.
// ASSERT: scan class 'Enum2' is deprecated. d too old.

@Deprecated
class Class {}

@Deprecated
class Interface {}

@Deprecated
class Struct {}

@Deprecated
class Enum {}

@Deprecated["a too old"]
class Class2 {}

@Deprecated["b too old"]
class Interface2 {}

@Deprecated["c too old"]
class Struct2 {}

@Deprecated["d too old"]
class Enum2 {}

main(): Unit {
    let c = Class()
    let i = Interface()
    let s = Struct()
    let e = Enum()

    let c2 = Class2()
    let i2 = Interface2()
    let s2 = Struct2()
    let e2 = Enum2()
}


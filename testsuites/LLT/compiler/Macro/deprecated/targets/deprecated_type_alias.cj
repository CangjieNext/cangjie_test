// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan type alias 'Alias' is deprecated.
// ASSERT: scan type alias 'Alias2' is deprecated since 999.
// ASSERT: scan class 'Class' is deprecated since 322. FF.
// ASSERT: scan type alias 'DeprecatedClassAlias' is deprecated since 454. MM.

@Deprecated
type Alias = Bool

@Deprecated[since: "999"]
type Alias2 = ?Bool

func foo(it: Alias) {
    it
}

func foo2(it!: Alias2 = false) {
    it
}

main(): Unit {
    let _: Alias = false
}

@Deprecated["FF", since: "322"]
class Class {}

type ClassAlias = Class

func foo3(it!: ClassAlias) {
    it
}

class NonDeprecatedClass {}

@Deprecated["MM", since: "454"]
type DeprecatedClassAlias = NonDeprecatedClass

func foo4() {
    let _: NonDeprecatedClass = NonDeprecatedClass() // ok
    DeprecatedClassAlias() // should be warning
}

type AdditionalAlias = DeprecatedClassAlias

func foo5() {
    AdditionalAlias() // ok
}


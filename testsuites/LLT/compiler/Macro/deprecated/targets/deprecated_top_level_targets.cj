// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan function 'foo' is deprecated.
// ASSERT: scan function 'foo2' is deprecated.
// ASSERT: scan variable 'a' is deprecated.
// ASSERT: scan variable 'b' is deprecated.
// ASSERT: scan variable 'aa' is deprecated.
// ASSERT: scan variable 'bb' is deprecated.
// ASSERT: scan variable 'aaa' is deprecated.
// ASSERT: scan variable 'bbb' is deprecated.
// ASSERT: scan function 'foo3' is deprecated.

@Deprecated
func foo() {}

@Deprecated
public func foo2() {}

@Deprecated
const func foo3() {
    1
}

@Deprecated
var a = 0
@Deprecated
let b = 0
@Deprecated
public var aa = 0
@Deprecated
public var bb = 0
@Deprecated
const aaa = 0
@Deprecated
public const bbb = 0

main(): Unit {
    foo()
    foo2()
    let _ = a == b
    if (aa == bb) {
        let _ = aaa == bbb
    }
}

const func foo3_caller() {
    foo3()
}


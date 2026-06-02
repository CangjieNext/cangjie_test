// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %disableCodegen %enableO2 -Woff all %f -o %n.%suffix 2>&1 | compare %f

class S {
    var x: Float64
    var y: Float64

    init(x: Float64, y: Float64) {
        this.x = x
        this.y = y
    }

    public func test() {
        x * y
    }
}

func foo(s: S) {
    println(s.x)
}

func test(cond: Bool) {
    var a = S(1.0, 1.0)
    if (cond) {
        foo(a)
        a.test()
    } else {
        foo(a)
        var b = S(2.0, 2.0)
        a = b
        foo(a)
        foo(a)
    }
    foo(a)
}

main() {
    test(true);
    0
}

// ASSERT: scan [RLE] The usages of the result of Load at [30,13] have been replaced by the value at [28,5]
// ASSERT: scan [RLE] The usages of the result of Load at [31,9] have been replaced by the value at [28,5]
// ASSERT: scan [RLE] The usages of the result of Load at [33,13] have been replaced by the value at [28,5]
// ASSERT: scan [RLE] The usages of the result of Load at [35,13] have been replaced by the value at [34,9]
// ASSERT: scan [RLE] The usages of the result of Load at [36,13] have been replaced by the value at [35,9]
// ASSERT: scan [RLE] The usages of the result of Load at [37,13] have been replaced by the value at [35,9]
// ASSERT: regex-not \[RLE\] The usages of the result of Load at \[39,.*\] have been replaced by the value at .*

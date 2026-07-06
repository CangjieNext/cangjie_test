// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: @JavaImpl inherits from specific @JavaMirror parent
// Scenario: Common has Exception class, specific @JavaMirror mirrors java.lang.Exception,
//           specific @JavaImpl inherits from the specific @JavaMirror
// Expected: Success - Object→Exception relaxation allowed, CJMP pair works

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

common open class Exception {
    common init()
    common func getMessage(): ?String
}

public common class C {
    public let x: Int64 = 42
    common public init() {}
    public func getValue(): Int64 { x }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
// ASSERT: scan-not error
package testpkg

import java.lang.*

@JavaMirror["java.lang.Exception"]
specific open class Exception {
    specific init()
    init(msg: String)
    specific func getMessage(): ?String
}

@JavaImpl
public specific class C <: Exception {
    specific public init() {
        super("my message")
    }
}
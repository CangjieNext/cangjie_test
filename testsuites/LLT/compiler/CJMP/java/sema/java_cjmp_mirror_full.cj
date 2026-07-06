// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: Full combination - @JavaMirror with fields common + fields specific + extra ctor
// Scenario: Common class has fields (let only), specific @JavaMirror adds fields and extra constructor (no body)
// Expected: Success - All features combined for @JavaMirror

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

public common class Test {
    public let id: Int64 = 1
    common public init() {}
    common func getName(): String
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
// ASSERT: scan-not error
package testpkg

import java.lang.*

@JavaMirror["com.example.Test"]
public specific class Test {
    var internalCounter: Int64 = 10
    specific public init()
    public init(custom: Int64)
    specific func getName(): String
}
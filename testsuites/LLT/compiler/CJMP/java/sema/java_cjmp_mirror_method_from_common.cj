// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: Common method in @JavaMirror without specific counterpart
// Scenario: Common has init() + method, specific @JavaMirror has only specific init()
//           init() matched (skipped), foo() unmatched → error
// Expected: Error - common method cannot be used in @JavaMirror without specific impl

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

public common class Test {
    common public init() {}
    common public func foo(): Int64 { 42 }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
package testpkg

import java.lang.*

@JavaMirror["com.example.Test"]
public specific class Test {
    specific public init()
}

/*SCAN-IN
error: @JavaMirror/@ObjCMirror class cannot have method with body in common part
*/
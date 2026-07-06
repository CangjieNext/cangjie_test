// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: @JavaMirror with extra methods in specific (no body - mirrored)
// Scenario: Common has methods, specific @JavaMirror declares extra methods beyond mirrored Java class
//           Extra methods in mirror are declarations (no body) - require native implementation
// Expected: Success - Extra method declarations allowed in @JavaMirror specific

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

public common class Test {
    common public init() {}
    common func getBaseValue(): Int64 { 100 }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
// ASSERT: scan-not error
package testpkg

import java.lang.*

@JavaMirror["com.example.Test"]
public specific class Test {
    let internalCounter: Int64 = 10
    specific public init()
    specific func getBaseValue(): Int64
    
    func getExtraValue(): Int64
    func combinedCalc(x: Int64): Int64
}

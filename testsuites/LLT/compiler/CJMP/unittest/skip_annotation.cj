// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/skip_annotation.cj
// EXEC-0: %compiler %noColor --experimental c/skip_annotation.cj --output-type=chir --output-dir ./c
package unittestskip

public common class Service {
    public init() {}
    public common func getStatus(): String { "ok" }
}

public func createService(): Service { Service() }

// SEPARATE-FILE: p/skip_annotation.cj
// EXEC-0: %compiler %noColor --experimental p/skip_annotation.cj --common-part-chir=c/unittestskip.chir --common-part-cjo=./c/unittestskip.cjo --output-type=dylib
package unittestskip

public specific class Service {
    public specific func getStatus(): String { "platform_ok" }
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor --test main.cj -lunittestskip -L. -o %output
// EXEC: %run %output
import unittestskip.*

@Test
func test_service_status() {
    let s = createService()
    @Expect(s.getStatus(), "platform_ok")
}

@Test
@Skip
func test_skipped() {
    let s = createService()
    @Expect(s.getStatus(), "ok")
}

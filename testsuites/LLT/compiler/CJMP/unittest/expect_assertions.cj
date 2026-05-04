// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/expect_assertions.cj
// EXEC-0: %compiler %noColor --experimental c/expect_assertions.cj --output-type=chir --output-dir ./c
package unittestexpect

public common class DataService {
    public init() {}
    
    public common func getValue(): Int64 { 42 }
    public common func getName(): String { "common" }
}

public func getData(): DataService { DataService() }

// SEPARATE-FILE: p/expect_assertions.cj
// EXEC-0: %compiler %noColor --experimental p/expect_assertions.cj --common-part-chir=c/unittestexpect.chir --common-part-cjo=./c/unittestexpect.cjo --output-type=dylib
package unittestexpect

public specific class DataService {
    public specific func getValue(): Int64 { 100 }
    public specific func getName(): String { "platform" }
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor --test main.cj -lunittestexpect -L. -o %output
// EXEC: %run %output
import unittestexpect.*

@Test
func test_expect_value_from_platform() {
    let data = getData()
    @Expect(data.getValue(), 100)
    @Expect(data.getName(), "platform")
}

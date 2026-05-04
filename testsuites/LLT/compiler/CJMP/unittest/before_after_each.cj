// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/before_after_each.cj
// EXEC-0: %compiler %noColor --experimental c/before_after_each.cj --output-type=chir --output-dir ./c
package unittestlifecycle

public common class Counter {
    public var count: Int64 = 0
    
    public init() {}
    
    public common func increment() { count += 1 }
    public common func getCount(): Int64 { count }
    public common func reset() { count = 0 }
}

public func getCounter(): Counter { Counter() }

// SEPARATE-FILE: p/before_after_each.cj
// EXEC-0: %compiler %noColor --experimental p/before_after_each.cj --common-part-chir=c/unittestlifecycle.chir --common-part-cjo=./c/unittestlifecycle.cjo --output-type=dylib
package unittestlifecycle

public specific class Counter {
    public specific func increment() { count += 10 }
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor --test main.cj -lunittestlifecycle -L. -o %output
// EXEC: %run %output
import unittestlifecycle.*

var setupCounter = 0
var teardownCounter = 0

@Test
class LifecycleTest {
    @BeforeEach
    func setup() {
        setupCounter += 1
        getCounter().reset()
    }
    
    @AfterEach
    func teardown() {
        teardownCounter += 1
    }
    
    @TestCase
    func test_first() {
        let c = getCounter()
        c.increment()
        @Expect(c.getCount(), 10)
    }
    
    @TestCase
    func test_second() {
        let c = getCounter()
        c.increment()
        c.increment()
        @Expect(c.getCount(), 20)
    }
}

@Test
func test_lifecycle_counts() {
    @Expect(setupCounter, 2)
    @Expect(teardownCounter, 2)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroComponent.cj
// EXEC: %compiler %cmp_macro macroComponent.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan start 123
// ASSERT: scan end

import component.*

struct Composer {
    public init() {}
    public func start(id: Int32) {
        print("start ${id}\n")
    }
    public func end() {
        print("end\n")
    }
}

/* after @Component
func MyComponent(composer: Composer) {
    composer.start(123)
    var counter = 0
    composer.end()
}*/
@Component[xxx]
func MyComponent() {
    var counter = 0
}

main(): Int64 {
    let composera = Composer()
    MyComponent(composera)
    return 0
}

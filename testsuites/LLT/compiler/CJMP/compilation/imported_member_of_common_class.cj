// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/settings.cj
// EXEC-0: %compiler %noColor --experimental c/settings.cj --output-type=chir --output-dir ./c
@NonProduct
features {}
package cjmp.settings

common public class SomeClass {
    private init() {
        throw Exception("unavailable")
    }
}

common public func call_in_package(context:SomeClass) : Unit

// SEPARATE-FILE: p/settings.cj
// EXEC-0: %compiler %noColor --experimental p/settings.cj c/cjmp.settings.chir --common-part-cjo=./c/cjmp.settings.cjo --output-type=staticlib --output-dir ./p
features { os.linux }
package cjmp.settings

specific public class SomeClass {
    private let savedString: String

    public init(context: String) {
        savedString = context
    }

    public func getPlatformContext(): String {
        return savedString
    }
}

specific public func call_in_package(context:SomeClass): Unit{
    context.getPlatformContext()
}

// SEPARATE-FILE: c/function.cj
// EXEC-0: %compiler %noColor --experimental c/function.cj --import-path=./c --output-type=chir --output-dir ./c
@NonProduct
features {}
package cjmp.function

import cjmp.settings.*

common public func call_in_other_package(context:SomeClass): Unit

// SEPARATE-FILE: p/function.cj
// EXEC-0: %compiler %noColor --experimental p/function.cj c/cjmp.function.chir --common-part-cjo=./c/cjmp.function.cjo --import-path=./p  -L ./p -lcjmp.settings --output-type=dylib --output-dir ./p
features { os.linux }
package cjmp.function

import cjmp.settings.SomeClass

specific public func call_in_other_package(context:SomeClass): Unit{
    context.getPlatformContext()
}



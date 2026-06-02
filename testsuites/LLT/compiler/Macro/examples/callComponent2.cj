// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroComponent2.cj
// EXEC: %compiler %cmp_macro macroComponent2.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan dataState a 0
// ASSERT: scan dataState b 1

import component2.*

/* after @Component
struct DataState {
    var a: Int64 = 0
    var b: Int64 = 1
}

class Data {
    var state = DataState()
    func getA() {
        return 0
    }

    func getB() {
        return 1
    }
}
 */
@Component
class Data {
    var a: Int64 = 0
    var b: Int64 = 1

    func getA() {
        return 0
    }

    func getB() {
        return 1
    }
}

main() {
    let data: Data = Data()
    print("dataState a " + data.state.a.toString() + "\n")
    print("dataState b " + data.state.b.toString() + "\n")
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %coverage_opt %f -o %output
// (not CJNATIVE) EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %output
// EXEC-0: %run %run_opt %output %run_args

public enum Enum_1675605667877_651 {
    defaultValue
    | fff((Int64, Bool))
}

public func func_1675605667877_631() { // block id: 633
    let var_1675605667877_656: Enum_1675605667877_651 = Enum_1675605667877_651.fff((65, false))

    match (var_1675605667877_656) {
        case fff(caseVar_1675605667877_721: (Int32, Int16)) => 0
        case _ => 2
    }
    0
}

main() {
    func_1675605667877_631()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %f %dumpCHIRDebug -o %output
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/*\_ClosureConversion.chir | compare %f
// (not Windows) ASSERT: regex-3 Func @_CCN7default4foo1HvEL_E\$\d+\$g\(\[readOnly\]
// (not Windows) ASSERT: regex-1 Func @_CCN7default4foo1HvEL_E\$g\(\[readOnly\]
// (not Windows) ASSERT: regex-3 Apply\(ThisType: Class-\$ClN7default4foo1HvEL_E\$\d+&, Class-\$ClN7default4foo1HvEL_E\$\d+&::@_CCN7default4foo1HvEL_E\$\d+\$i
// (not Windows) ASSERT: regex-1 Apply\(ThisType: Class-\$ClN7default4foo1HvEL_E\$\d+&, Class-\$ClN7default4foo1HvEL_E\$\d+&::@_CCN7default4foo1HvEL_E\$i

var a = 1

func foo1() {
    try {
        a++
    } finally {
        try {
            a++
        } finally {
            let x = {=> 0}
            x()
        }
    }
}

main() {
    0
}

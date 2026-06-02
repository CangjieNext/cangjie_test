/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (String.join(["", "qwerty", "#=+\t\""], delimiter: "") != "qwerty#=+\t\"") {
        return 1
    }

    if (String.join(["", "AdfdfS23Dlk", "仓颉"], delimiter: "and") != "andAdfdfS23Dlkand仓颉") {
        return 1
    }

    if (String.join(["", "u1s1", "\u{1001}"], delimiter: "+") != "+u1s1+\u{1001}") {
        return 1
    }

    if (String.join(["", "&*(){}[]", "仓颉"], delimiter: "\u{f1}") != "\u{f1}&*(){}[]\u{f1}仓颉") {
        return 1
    }

    if (String.join(["", "&*(){}[]", "\u{f1}"], delimiter: "仓颉") != "仓颉&*(){}[]仓颉\u{f1}") {
        return 1
    }

    if (String.join(["", "\u{f1}", "仓颉"], delimiter: "哈啰") != "哈啰\u{f1}哈啰仓颉") {
        return 1
    }

    if (String.join(["aAzZ", "!@$%/>-", "仓颉"], delimiter: "\u{f1}") != "aAzZ\u{f1}!@$%/>-\u{f1}仓颉") {
        return 1
    }

    if (String.join(["bjSDDyt", "!@$%/>-", "#=+\t\""], delimiter: "==") != "bjSDDyt==!@$%/>-==#=+\t\"") {
        return 1
    }

    if (String.join(["<>:\"?~", "仓颉", "\u{f99fe}"], delimiter: "or") != "<>:\"?~or仓颉or\u{f99fe}") {
        return 1
    }

    if (String.join(["bjSDDyt", "仓颉", "\u{f99fe}"], delimiter: "or") != "bjSDDytor仓颉or\u{f99fe}") {
        return 1
    }

    return 0
}

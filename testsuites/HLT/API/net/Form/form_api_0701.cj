/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.encoding.url.*

var form1 = Form("1=a")

main(): Int64 {
    var form2 = form1.clone()
    var form3 = form2.clone()
    var form4 = form3.clone()
    var form5 = form4.clone()
    form1.add("2", "8")
    if (case01(form5.get("1")) != "a") {
        return 1
    }
    if (case01(form2.get("2")) != "No") {
        return 2
    }
    if (case01(form1.get("2")) != "8") {
        return 3
    }
    return 0
}

func case01(a: Option<String>) {
    return match (a) {
        case Some(y) => y
        case None => "No"
    }
}

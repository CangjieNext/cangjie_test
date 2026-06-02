/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %overflow_wrapping %cmp_opt  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.encoding.url.*

main(): Int64 {
    let url = URL.parse(
        "http://192.168.11.62:8843/apis/resource.sop.intest.com/v1/pubnodeconfs?filedSelector=metadata.name%3Dsoppub.master1&&")
    var res = url.queryForm.get("filedSelector").getOrThrow()
    let f = Form("filedSelector=metadata.name%3Dsoppub.master1&&")
    var res1 = f.get("filedSelector").getOrThrow()
    if ((res == "metadata.name=soppub.master1") && (res1 == "metadata.name=soppub.master1")) {
        return 0
    }
    return 1
}

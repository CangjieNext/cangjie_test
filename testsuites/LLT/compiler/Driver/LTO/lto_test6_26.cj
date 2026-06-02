// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %set_stdx_path %run %run_opt %output %run_args

internal import stdx.encoding.json.*

main() {
    var strO = ##"{"name":"Tom","age":"18","version":"0.1.1"}"##
    var kO = JsonValue.fromStr(strO)
    var resO = kO.asObject().get("name").getOrThrow()
    if (resO.toString() == "\"Tom\"") {
        return 0
    }
    return 1
}

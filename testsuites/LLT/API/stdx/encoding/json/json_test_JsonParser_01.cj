/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan pass01 pass02 pass03 pass04
import stdx.encoding.json.*

main() {
    var str01 = "[true,\"kjjjke\\\"eed\",{\"sdfd\":\"ggggg\",\"eeeee\":[341,false,{\"nnnn\":55.87}]},3422,22.341,false,[22,22.22,true,\"ddd\"],43]"
    var str02 = ##"[true,"kjjjke\"eed",{"sdfd":"ggggg","eeeee":[341,false,{"nnnn":55.87}]},3422,22.341,false,[22,22.22,true,"ddd"],43]"##
    if (str01 == str02) {
        print("pass01 ")
    } else {
        print("fail01 ")
    }
    var jv01: JsonValue = JsonValue.fromStr(str01)
    var jv02: JsonValue = JsonValue.fromStr(str02)
    var res01 = jv01.toString()
    var res02 = jv02.toString()
    if (res01 == res02) {
        print("pass02 ")
    } else {
        print("fail02 ")
    }
    if (res01 == str01) {
        print("pass03 ")
    } else {
        print("fail03 ")
    }
    if (res02 == str02) {
        print("pass04 ")
    } else {
        print("fail04 ")
    }
    0
}

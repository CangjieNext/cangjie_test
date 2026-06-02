/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass01
import stdx.encoding.json.*

main() {
    var str01 = ##"[true,"kjjjke\"eed",{"sdfd":"ggggg","eeeee":[341,false,{"nnnn":55.87}]},3422,22.341,false,[22,22.22,true,"ddd"],43]"##
    var str02 = ##"[true,"kjjjke\"eed",{"sdfd":"ggggg","eeeee":[341,false,{"nnnn":55.87}]},3422,22.341,false,[22,22.22,true,"ddd"],43]"##
    var jv: JsonValue = JsonValue.fromStr(str01)
    if (jv.toString() == str02) {
        print("pass01")
    } else {
        print("fail01")
    }
    0
}

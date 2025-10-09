// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0
// EXEC: %compiler %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
 
import std.time.*
func getBpaBatch(): Int64 {
    var spaBatchParamsListPatition = Array<Int>()
    for(spaBatchParamsSubList in spaBatchParamsListPatition){
        try {
            for(pageIndex in 2..4){
                DateTime.now()
            }
        } catch (ex: Exception) {
        }
    }
    return 0
}
 
main(): Int {
    return 0
}
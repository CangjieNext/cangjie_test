// LEVEL: 0
// EXEC-PIPE-1: %compiler %enableO2 %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: scan array index is out of bounds

 interface j   {
    func b() { 
        var l : ((Int64)) -> Option<Int64> = n
    }
}
class ac <: j {}

func n(ao : (Int64)) { 
    let aq = ("" is UInt16, 0)
    if (false) { 
        match (aq) {
        case (_,_ ) => 
            let m = [ac() as Int64]
            m
    } 
    } else { [Option<Int64>.None] }   [2]
}


main() {}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

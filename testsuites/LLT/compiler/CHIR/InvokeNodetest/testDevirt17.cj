// LEVEL: 0
// EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// EXEC:%run %run_opt %output %run_args
// ASSERT: scan The function call to $aget in the line 34 and the column 12 was an invoke call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I {
    prop a:Int64
}

open class RR <: I {
    public open prop a:Int64 {
       get(){
        return 1
       }
    }
}

open class RRR <: RR {
    public prop a:Int64 {
       get(){
        return 2
       }
    }
}

class R {
    public var a:I = RR()
}

main() {
    var b = R()
    return b.a.a - 1
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

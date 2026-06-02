/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



open class Base {
open func foo(x:Int32):Int32{
return x
}
}

class Data <: Base {
static override func foo(x:Int32):Int32{ 
return 2*x
}
}

func run(): Int64 {
var res: Int32 = Data.foo(1);
if (res != 2) {
return 1
}
return 0
}

main(): Int64 {
return run()
}
// ASSERT: scan parse_conflict_modifier

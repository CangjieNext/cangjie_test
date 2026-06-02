/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output


interface A{
static func test():Int64{1}
static func a():Int64{1}
static func b():Int64{1}
}

interface X <: A{
static override func a():Int64{2} 
override static func a():Int64{2} 
}


open class B{
func test():Int64{1}
}

class Y <: B{
override static func test():Int64{3} 
}

abstract class C{
static func test():Int64{1}
}

abstract class Z <: C{
static override func test():Int64{4} 
}

main(){
return 1
}
// ASSERT: scan parse_conflict_modifier

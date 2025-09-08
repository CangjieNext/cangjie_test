// LEVEL: 0
// EXEC-PIPE-1:%compiler %n.cj 2>&1 | compare %f
// ASSERT: regex escapePoint in var_circular_dependency.cj:9:1 and bottomUpTree in var_circular_dependency.cj:9:1 might have circular dependency
 
enum Tree{
	Empty | Node(Tree,Tree)
}

var escapePoint: Tree = bottomUpTree(1)

func bottomUpTree(depth:UInt32):Tree{
  let t: Tree =  Node(bottomUpTree(depth - 1), bottomUpTree(depth - 1))
  escapePoint = t
  return t               
}

main(args: Array<String>) : Unit {
    bottomUpTree(10)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

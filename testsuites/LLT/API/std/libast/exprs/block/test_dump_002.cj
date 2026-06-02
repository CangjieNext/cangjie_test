// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var cnt = 0
    public override func visit(curNode: CallExpr) {
        cnt += 1
    }
    public override func visit(curNode: VarDecl) {
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        unsafe {
            let src = acquireArrayRawData(data)
            let dst = acquireArrayRawData(ret)
            memcpy_s(CPointer<UInt8>(dst.pointer), UIntNative(8), src.pointer, UIntNative(8))
            releaseArrayRawData(src)
            releaseArrayRawData(dst)
        }
    )
    let block = parseExpr(input)
    if (!(block is Block)) {
        return 1
    }

    if ((block as Block).getOrThrow().nodes.size != 5) {
        return 2
    }
    block.traverse(myVisitor)
    if (myVisitor.cnt != 4) {
        return 3
    }

    let output = quote($block)
    let flag = compareTokens(input, output)
    if (!flag) {
        return 4
    }

    block.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

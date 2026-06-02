// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        try {
            return x + x
        } catch (e: Exception) {
            print("Exception\n")
        }
    )

    let input2 = quote(
        try {
            let lastElement = arrayTest[3]
        } catch (e: ArithmeticException | IndexOutOfBoundsException) {
            print("exception info:" + e)
        } catch (e: Exception) {
            print("Other")
        } finally {
            let a1 = 1
            let a2 = 2
        }
    )

    let input3 = quote(
        try(input = FileInputStream("input.txt"),
            output = FileOutputStream("output.txt")) {
            while(input.hasNextLine()) {
                doSomething()
            }
        } catch (e: IOException) {
            foo()
        } finally {
            bar()
        }
    )

    let expr1 = (parseExpr(input1) as TryExpr).getOrThrow()
    let expr2 = (parseExpr(input2) as TryExpr).getOrThrow()
    let expr3 = (parseExpr(input3) as TryExpr).getOrThrow()

    // test input1
    if (expr1.resourceSpec.size != 0) {
        return 2
    }
    if (expr1.tryBlock.nodes.size != 1) {
        return 3
    }
    let catchPatterns = expr1.catchPatterns
    if (catchPatterns.size != 1) {
        return 4
    }
    let p0 = catchPatterns[0]
    p0.toTokens()
    if (!(p0 is ExceptTypePattern)) {
        return 5
    }
    if (!((p0 as ExceptTypePattern).getOrThrow().pattern is VarPattern)) {
        return 6
    }
    if ((p0 as ExceptTypePattern).getOrThrow().types.size != 1) {
        return 7
    }

    // test input2
    if (expr2.catchPatterns.size != 2 || expr2.catchBlocks.size != 2) {
        return 9
    }
    if (expr2.finallyBlock.nodes.size != 2) {
        return 11
    }

    // getResourceSpec API needs to be checked.
    if (expr3.resourceSpec.size != 2) {
        return 12
    }
    
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

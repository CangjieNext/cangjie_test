// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        try {
            return x + x
        } catch (e: Exception) {
            print("Exception\n")
        } finally {
            x = 2;
            return x + x;
        }
    )

    let input2 = quote(
        try {
            throw ArithmeticException()
        } catch (e: Exception) {
            print("Exception\n")
        }
    )

    let input3 = quote(
        try {
            let lastElement = arrayTest[3]
        } catch(_) {
            print("catch an exception!")
        }
    )

    let input4 = quote(
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

    let input5 = quote(
        try(input = FileInputStream("input.txt"),
            output = FileOutputStream("output.txt")) {
            while(input.hasNextLine()) {
                doSomething()
            }
        } finally {
            foo()
        }
    )

    let input6 = quote(
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

    let expr1 = parseExpr(input1)
    let expr2 = parseExpr(input2)
    let expr3 = parseExpr(input3)
    let expr4 = parseExpr(input4)
    let expr5 = parseExpr(input5)
    let expr6 = parseExpr(input6)

    let output1 = quote($input1)
    let output2 = quote($input2)
    let output3 = expr3.toTokens()
    let output4 = expr4.toTokens()
    let output5 = quote($input5)
    let output6 = quote($input6)

    if (!compareTokens(input1, output1)) {
        return 1
    }
    if (!compareTokens(input2, output2)) {
        return 2
    }
    if (!compareTokens(input3, output3)) {
        output3.dump()
        return 3
    }
    if (!compareTokens(input4, output4)) {
        return 4
    }
    if (!compareTokens(input5, output5)) {
        return 5
    }
    if (!compareTokens(input6, output6)) {
        return 6
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

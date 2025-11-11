/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func func1(para: Int64): Int64 {
    try {
        throw IllegalArgumentException()
    } catch (e: ArithmeticException) {
        print("catch an ArithmeticException exception!")
    } catch (e: Exception) {
        print("catch an Exception exception!")
    } catch (e: OverflowException) {
        print("catch an OverflowException exception!")
    }

    return para
}

main(): Int64 {
    func1(0)

    return 0
}

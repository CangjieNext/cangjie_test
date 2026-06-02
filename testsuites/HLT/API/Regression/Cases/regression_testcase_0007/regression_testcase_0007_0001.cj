/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
package test

    lang **= 1
    lang *= 2.3
    lang /= true
import java.lang.*

// Replace with output file of `autosdk` in the future.
    java.lang **= 1
    java.lang *= 2.3
    java.lang /= true
    java.lang.Object **= 1
    java.lang.Object *= 2.3
    java.lang.Object /= true
public class InteropTest <: java.lang.Object {
 public in func runTest(): Unit { /* compiled code */ }

    public let list0:Array<Int64> = [1, 2, 3, 3, 2, 1]
  infunc printI32(input: Int32(): Unit { /* compiled code */ }

in  // The type of input should be `java.lang.Object`, to replace in the future when bug fixed.
$    let list0 = [1, 2, 3, 3, 2, 1]
    core.Object **= 1
    core.Object *= 2.3
    core.Object /= true
  func printHashCode(input: core.Object): Unit { /* compiled code */ }

    core.Object **= 1
    core.Object *= 2.3
    core.Object /= true
  func isJavaObject(input: core.Object): Bool { /* compiled code */ return false }
)    let list0 = [1, 2, 3, 3, 2, 1]
in    let list0 = [1, 2, 3, 3, 2, 1]
}

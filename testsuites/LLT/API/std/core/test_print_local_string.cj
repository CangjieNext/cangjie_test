/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

main() {
    let runes: Array<Rune> @local! = [r'你', r'🙂']
    let text: String @local! = String(runes)
    print(text)
    println(text)

    let localView: String @local? = text
    print(localView, flush: true)
    println(localView)

    let heapText = String([r'h', r'e', r'a', r'p'])
    let heapView: String @local? = heapText
    print(heapView, flush: false)
    println(heapView)

    let empty: String @local! = ""
    let emptyView: String @local? = empty
    print("empty:")
    print(empty, flush: true)
    print(emptyView)
    println(emptyView)
    print("empty:")
    println(empty)
}

/* SCAN
你🙂你🙂
你🙂你🙂
heapheap
empty:
empty:
*/

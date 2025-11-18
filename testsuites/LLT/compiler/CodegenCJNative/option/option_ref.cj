// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run $run_opt %output %run_utest_opt

class BytesTrieMap<V> <: Iterable<EntryKV<V>> {
    public func iterator(): Iterator<EntryKV<V>> {
        return BytesIterator()
    }
}

class BytesIterator<V> <: Iterator<EntryKV<V>> {
    private var entry: EntryKV<V>
    public init() {
        entry = EntryKV<V>()
    }
    public func next(): ?EntryKV<V> {
        return entry
    }
}

open class EntryKV<V> {}

@Test
class OptionTest {
    @TestCase
    func testOption01() {
        @Assert(BytesIterator<String>().next().isSome(), true)
        @Assert(BytesTrieMap<String>().iterator().next().isSome(), true)
        @Assert((BytesTrieMap<String>().iterator() as BytesIterator<String>).getOrThrow().next().isSome(), true)
    }
}
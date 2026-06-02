/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output 



import std.unittest
import std.unittest.testmacro
import std.collection
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unon.*
 
@Test
class LinkedList_last_test{

    @TestCase
    func test_last(): Unit {
        let linkedlist1: LinkedList<Int64> = LinkedList<Int64>()
        let linkedlist2: LinkedList<String> = LinkedList<String>(["test"])
        let linkedlist3: LinkedList<Int64> = LinkedList<Int64>(6, {x => x})
        @Expect(linkedlist1.last, None)
        @Expect(linkedlist2.last, Some("test"))
        @Expect(linkedlist3.last, Some(5))
    }
}
// ASSERT: scan parse_expected_name
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_right_delimiter

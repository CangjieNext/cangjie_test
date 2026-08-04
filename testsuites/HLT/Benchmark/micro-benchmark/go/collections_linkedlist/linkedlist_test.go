/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_linkedlist

import (
	"container/list"
	"testing"
)

func BenchmarkLinkedList_AddFirst_Blank(b *testing.B) {
	for i := 0; i < b.N; i++ {
		list.New()
	}
}

func BenchmarkLinkedList_AddFirst_Int64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		l.PushFront(int64(0))
	}
}

func BenchmarkLinkedList_AddFirst_UInt8(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		l.PushFront(uint8(0))
	}
}

func BenchmarkLinkedList_AddFirst_Float64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		l.PushFront(3.14)
	}
}

func BenchmarkLinkedList_AddFirst_String(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		l.PushFront("test")
	}
}

func BenchmarkLinkedList_AddFirst_Int64_G16(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		for j := 0; j < 16; j++ {
			l.PushFront(int64(j))
		}
	}
}

func BenchmarkLinkedList_AddFirst_Int64_G128(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		for j := 0; j < 128; j++ {
			l.PushFront(int64(j))
		}
	}
}

func BenchmarkLinkedList_AddFirst_Int64_G1024(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		for j := 0; j < 1024; j++ {
			l.PushFront(int64(j))
		}
	}
}

func BenchmarkLinkedList_addLast_Blank(b *testing.B) {
	for i := 0; i < b.N; i++ {
		list.New()
	}
}

func BenchmarkLinkedList_addLast_Int64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		l.PushBack(int64(0))
	}
}

func BenchmarkLinkedList_addLast_UInt8(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		l.PushBack(uint8(0))
	}
}

func BenchmarkLinkedList_addLast_Float64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		l.PushBack(3.14)
	}
}

func BenchmarkLinkedList_addLast_String(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		l.PushBack("test")
	}
}

func BenchmarkLinkedList_addLast_Int64_G16(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		for j := 0; j < 16; j++ {
			l.PushBack(int64(j))
		}
	}
}

func BenchmarkLinkedList_addLast_Int64_G128(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		for j := 0; j < 128; j++ {
			l.PushBack(int64(j))
		}
	}
}

func BenchmarkLinkedList_addLast_Int64_G1024(b *testing.B) {
	for i := 0; i < b.N; i++ {
		l := list.New()
		for j := 0; j < 1024; j++ {
			l.PushBack(int64(j))
		}
	}
}

var (
	listInt64_N8    *list.List
	listInt64_N128  *list.List
	listInt64_N1024 *list.List
	listUInt8_N8    *list.List
	listString_N8   *list.List
)
func initTestData() {
	listInt64_N8 = createLinkedList(8, int64(0))
	listInt64_N128 = createLinkedList(128, int64(0))
	listInt64_N1024 = createLinkedList(1024, int64(0))
	listUInt8_N8 = createLinkedList(8, uint8(0))
	listString_N8 = createLinkedList(8, "test")
}

func createLinkedList[T any](size int, element T) *list.List {
	l := list.New()
	for i := 0; i < size; i++ {
		l.PushFront(element)
	}
	return l
}

func BenchmarkLinkedList_first_Int64_N8(b *testing.B) {
	if listInt64_N8 == nil {
		initTestData()
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e := listInt64_N8.Front(); e != nil {
			_ = e.Value.(int64)
		}
	}
}

func BenchmarkLinkedList_first_Int64_N128(b *testing.B) {
	if listInt64_N128 == nil {
		initTestData()
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e := listInt64_N128.Front(); e != nil {
			_ = e.Value.(int64)
		}
	}
}

func BenchmarkLinkedList_first_Int64_N1024(b *testing.B) {
	if listInt64_N1024 == nil {
		initTestData()
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e := listInt64_N1024.Front(); e != nil {
			_ = e.Value.(int64)
		}
	}
}

func BenchmarkLinkedList_first_UInt8_N8(b *testing.B) {
	if listUInt8_N8 == nil {
		initTestData()
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e := listUInt8_N8.Front(); e != nil {
			_ = e.Value.(uint8)
		}
	}
}

func BenchmarkLinkedList_first_String_N8(b *testing.B) {
	if listString_N8 == nil {
		initTestData()
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e := listString_N8.Front(); e != nil {
			_ = e.Value.(string)
		}
	}
}

func BenchmarkLinkedList_last_Int64_N8(b *testing.B) {
	if listInt64_N8 == nil {
		initTestData()
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e := listInt64_N8.Back(); e != nil {
			_ = e.Value.(int64)
		}
	}
}

func BenchmarkLinkedList_last_Int64_N128(b *testing.B) {
	if listInt64_N128 == nil {
		initTestData()
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e := listInt64_N128.Back(); e != nil {
			_ = e.Value.(int64)
		}
	}
}

func BenchmarkLinkedList_last_Int64_N1024(b *testing.B) {
	if listInt64_N1024 == nil {
		initTestData()
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e := listInt64_N1024.Back(); e != nil {
			_ = e.Value.(int64)
		}
	}
}

func BenchmarkLinkedList_last_UInt8_N8(b *testing.B) {
	if listUInt8_N8 == nil {
		initTestData()
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e := listUInt8_N8.Back(); e != nil {
			_ = e.Value.(uint8)
		}
	}
}

func BenchmarkLinkedList_last_String_N8(b *testing.B) {
	if listString_N8 == nil {
		initTestData()
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e := listString_N8.Back(); e != nil {
			_ = e.Value.(string)
		}
	}
}

var templateInt64_N16 *list.List
var templateInt64_N256 *list.List

func init_remove() {
	templateInt64_N16 = createLinkedList(16, int64(0))
	templateInt64_N256 = createLinkedList(256, int64(0))
}

func blackhole(x interface{}) {
	_ = x
}

func BenchmarkLinkedList_addAfter_N16_p1(b *testing.B) {
	l := createLinkedList(16, int64(0))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		l.InsertAfter(int64(0), l.Front())
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_addAfter_N16_p2(b *testing.B) {
	l := createLinkedList(16, int64(0))
	e := getNthElement(l, 7)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e != nil {
			l.InsertAfter(int64(0), e)
		} else {
			l.PushFront(int64(0))
		}
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_addAfter_N16_p3(b *testing.B) {
	l := createLinkedList(16, int64(0))
	e := getNthElement(l, 15)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e != nil {
			l.InsertAfter(int64(0), e)
		} else {
			l.PushFront(int64(0))
		}
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_addAfter_N256_p1(b *testing.B) {
	l := createLinkedList(256, int64(0))	
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		l.InsertAfter(int64(0), l.Front())
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_addAfter_N256_p2(b *testing.B) {
	l := createLinkedList(256, int64(0))
	e := getNthElement(l, 127)	
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e != nil {
			l.InsertAfter(int64(0), e)
		} else {
			l.PushFront(int64(0))
		}
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_addAfter_N256_p3(b *testing.B) {
	l := createLinkedList(256, int64(0))
	e := getNthElement(l, 255)	
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e != nil {
			l.InsertAfter(int64(0), e)
		} else {
			l.PushFront(int64(0))
		}
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_addBefore_N16_p1(b *testing.B) {
	l := createLinkedList(16, int64(0))
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		l.InsertBefore(int64(0), l.Front())
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_addBefore_N16_p2(b *testing.B) {
	l := createLinkedList(16, int64(0))
	e := getNthElement(l, 7)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e != nil {
			l.InsertBefore(int64(0), e)
		} else {
			l.PushFront(int64(0))
		}
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_addBefore_N16_p3(b *testing.B) {
	l := createLinkedList(16, int64(0))
	e := getNthElement(l, 15)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e != nil {
			l.InsertBefore(int64(0), e)
		} else {
			l.PushFront(int64(0))
		}
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_addBefore_N256_p1(b *testing.B) {
	l := createLinkedList(256, int64(0))	
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		l.InsertBefore(int64(0), l.Front())
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_addBefore_N256_p2(b *testing.B) {
	l := createLinkedList(256, int64(0))
	e := getNthElement(l, 127)	
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e != nil {
			l.InsertBefore(int64(0), e)
		} else {
			l.PushFront(int64(0))
		}
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_addBefore_N256_p3(b *testing.B) {
	l := createLinkedList(256, int64(0))
	e := getNthElement(l, 255)	
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if e != nil {
			l.InsertBefore(int64(0), e)
		} else {
			l.PushFront(int64(0))
		}
		blackhole(l.Len())
	}
}

func BenchmarkLinkedList_remove_N16_p1(b *testing.B) {
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		l := createLinkedList(16, int64(0))
		if e := l.Front(); e != nil {
			value := l.Remove(e).(int64)
			blackhole(value)
		}
	}
}

func BenchmarkLinkedList_remove_N16_p2(b *testing.B) {
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		l := createLinkedList(16, int64(0))
		e := getNthElement(l, 7)
		if e != nil {
			value := l.Remove(e).(int64)
			blackhole(value)
		}
	}
}

func BenchmarkLinkedList_remove_N16_p3(b *testing.B) {
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		l := createLinkedList(16, int64(0))
		e := getNthElement(l, 15)
		if e != nil {
			value := l.Remove(e).(int64)
			blackhole(value)
		}
	}
}

func BenchmarkLinkedList_remove_N256_p1(b *testing.B) {
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		l := createLinkedList(256, int64(0))
		if e := l.Front(); e != nil {
			value := l.Remove(e).(int64)
			blackhole(value)
		}
	}
}

func BenchmarkLinkedList_remove_N256_p2(b *testing.B) {
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		l := createLinkedList(256, int64(0))
		e := getNthElement(l, 127)
		if e != nil {
			value := l.Remove(e).(int64)
			blackhole(value)
		}
	}
}

func BenchmarkLinkedList_remove_N256_p3(b *testing.B) {
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		l := createLinkedList(256, int64(0))
		e := getNthElement(l, 255)
		if e != nil {
			value := l.Remove(e).(int64)
			blackhole(value)
		}
	}
}

// 辅助函数：获取第 n 个元素（从 0 开始）
func getNthElement(l *list.List, n int) *list.Element {
	e := l.Front()
	for i := 0; i < n && e != nil; i++ {
		e = e.Next()
	}
	return e
}

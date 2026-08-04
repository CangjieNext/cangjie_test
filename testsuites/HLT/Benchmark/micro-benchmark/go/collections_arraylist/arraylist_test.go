/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_arraylist

import (
	"testing"
	"strings"
)

// go 的 slice 和 arraylist 并不等价，这里用于提供基线

var data int 

func benchmarkArrayList_Init_Capacity(b *testing.B, arrLen int) {
	for i := 0; i < b.N; i++ {
		arr := make([]int, arrLen)
		arr[0] = data
	}
}

func BenchmarkArrayListInitCapacity_N16(b *testing.B)      { benchmarkArrayList_Init_Capacity(b, 16) }
func BenchmarkArrayListInitCapacity_N128(b *testing.B)     { benchmarkArrayList_Init_Capacity(b, 128) }
func BenchmarkArrayListInitCapacity_N1024(b *testing.B)    { benchmarkArrayList_Init_Capacity(b, 1024) }
func BenchmarkArrayListInitCapacity_N8192(b *testing.B)    { benchmarkArrayList_Init_Capacity(b, 8192) }
func BenchmarkArrayListInitCapacity_N65536(b *testing.B)   { benchmarkArrayList_Init_Capacity(b, 65536) }
func BenchmarkArrayListInitCapacity_N1048576(b *testing.B) { benchmarkArrayList_Init_Capacity(b, 1048576) }

func benchmarkArrayList_Init_HashSet(b *testing.B, arrLen int) {
	for i := 0; i < b.N; i++ {
		arr := make([]int, arrLen)
		for i:= 0; i < arrLen; i++ {
			arr[i] = 0
		}
	}
}

func BenchmarkArrayListInitFromHashSet_N16(b *testing.B)      { benchmarkArrayList_Init_HashSet(b, 16) }
func BenchmarkArrayListInitFromHashSet_N128(b *testing.B)     { benchmarkArrayList_Init_HashSet(b, 128) }
func BenchmarkArrayListInitFromHashSet_N1024(b *testing.B)    { benchmarkArrayList_Init_HashSet(b, 1024) }
func BenchmarkArrayListInitFromHashSet_N8192(b *testing.B)    { benchmarkArrayList_Init_HashSet(b, 8192) }
func BenchmarkArrayListInitFromHashSet_N65536(b *testing.B)   { benchmarkArrayList_Init_HashSet(b, 65536) }

func BenchmarkArrayListInitFromLinkedList_N16(b *testing.B)      { benchmarkArrayList_Init_HashSet(b, 16) }
func BenchmarkArrayListInitFromLinkedList_N128(b *testing.B)     { benchmarkArrayList_Init_HashSet(b, 128) }
func BenchmarkArrayListInitFromLinkedList_N1024(b *testing.B)    { benchmarkArrayList_Init_HashSet(b, 1024) }
func BenchmarkArrayListInitFromLinkedList_N8192(b *testing.B)    { benchmarkArrayList_Init_HashSet(b, 8192) }
func BenchmarkArrayListInitFromLinkedList_N65536(b *testing.B)   { benchmarkArrayList_Init_HashSet(b, 65536) }

func BenchmarkArrayListAppendInt64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		var arr []int64
		arr = append(arr, 654321)
	}
}

func BenchmarkArrayListAppendUInt8(b *testing.B) {
	var aByte byte
	aByte = 66
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		var arr []byte
		arr = append(arr, aByte)
	}
}

func BenchmarkArrayListAppendFloat64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		var arr []float64
		arr = append(arr, 3.14)
	}
}

func BenchmarkArrayListAppendBoolean(b *testing.B) {
	for i := 0; i < b.N; i++ {
		var arr []bool
		arr = append(arr, true)
	}
}

func benchmarkArrayListAppendString(b *testing.B, str_Size int) {
	str := strings.Repeat("A", str_Size)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		var arr []string
		arr = append(arr, str)
	}
}

func BenchmarkArrayListAppendString_N8(b *testing.B)      { benchmarkArrayListAppendString(b, 8) }
func BenchmarkArrayListAppendString_N64(b *testing.B)      { benchmarkArrayListAppendString(b, 64) }
func BenchmarkArrayListAppendString_N512(b *testing.B)      { benchmarkArrayListAppendString(b, 512) }
func BenchmarkArrayListAppendString_N4096(b *testing.B)      { benchmarkArrayListAppendString(b, 4096) }

func benchmarkArrayListAppendAll(b *testing.B, arrLen int) {
	arr := make([]int64, arrLen)
	for i:= 0; i < arrLen; i++ {
		arr[i] = 0
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		var arrnew []int64
		arrnew = append(arrnew, arr...)
	}
}

func BenchmarkArrayListAppendAll_N16(b *testing.B)      { benchmarkArrayListAppendAll(b, 16) }
func BenchmarkArrayListAppendAll_N128(b *testing.B)      { benchmarkArrayListAppendAll(b, 128) }
func BenchmarkArrayListAppendAll_N1024(b *testing.B)      { benchmarkArrayListAppendAll(b, 1024) }
func BenchmarkArrayListAppendAll_N8192(b *testing.B)      { benchmarkArrayListAppendAll(b, 8192) }
func BenchmarkArrayListAppendAll_N65536(b *testing.B)      { benchmarkArrayListAppendAll(b, 65536) }

// go没有hashset类型 / 类似方法，仅提供基线
func BenchmarkArrayListAppendAllHashSet_N16(b *testing.B)      { benchmarkArrayListAppendAll(b, 16) }
func BenchmarkArrayListAppendAllHashSet_N128(b *testing.B)      { benchmarkArrayListAppendAll(b, 128) }
func BenchmarkArrayListAppendAllHashSet_N1024(b *testing.B)      { benchmarkArrayListAppendAll(b, 1024) }
func BenchmarkArrayListAppendAllHashSet_N8192(b *testing.B)      { benchmarkArrayListAppendAll(b, 8192) }
func BenchmarkArrayListAppendAllHashSet_N65536(b *testing.B)      { benchmarkArrayListAppendAll(b, 65536) }

func BenchmarkArrayListAppendAllLinkedList_N16(b *testing.B)      { benchmarkArrayListAppendAll(b, 16) }
func BenchmarkArrayListAppendAllLinkedList_N128(b *testing.B)      { benchmarkArrayListAppendAll(b, 128) }
func BenchmarkArrayListAppendAllLinkedList_N1024(b *testing.B)      { benchmarkArrayListAppendAll(b, 1024) }
func BenchmarkArrayListAppendAllLinkedList_N8192(b *testing.B)      { benchmarkArrayListAppendAll(b, 8192) }
func BenchmarkArrayListAppendAllLinkedList_N65536(b *testing.B)      { benchmarkArrayListAppendAll(b, 65536) }

// insert 仅供参考
func fakeInsert(arr []int64, index int, value int64) []int64 {
    result := make([]int64, len(arr)+1)
    copy(result[:index], arr[:index])
    result[index] = value
    copy(result[index+1:], arr[index:])
    return result
}

func benchmarkArrayListInsert_Int64(b *testing.B, arrsize int, index int) {
	arr := make([]int64, arrsize)
	for i:= 0; i < arrsize; i++ {
		arr[i] = int64(i)
	}
	for i := 0; i < b.N; i++ {	
		src_arr := arr
		src_arr = fakeInsert(src_arr, index, 888)
	}
}

func BenchmarkArrayListInsert_Int64_N16_start(b *testing.B)      { benchmarkArrayListInsert_Int64(b, 16, 0) }
func BenchmarkArrayListInsert_Int64_N16_mid(b *testing.B)      { benchmarkArrayListInsert_Int64(b, 16, 8) }
func BenchmarkArrayListInsert_Int64_N16_end(b *testing.B)      { benchmarkArrayListInsert_Int64(b, 16, 16) }
func BenchmarkArrayListInsert_Int64_N256_start(b *testing.B)      { benchmarkArrayListInsert_Int64(b, 256, 0) }
func BenchmarkArrayListInsert_Int64_N256_mid(b *testing.B)      { benchmarkArrayListInsert_Int64(b, 256, 128) }
func BenchmarkArrayListInsert_Int64_N256_end(b *testing.B)      { benchmarkArrayListInsert_Int64(b, 256, 256) }
func BenchmarkArrayListInsert_Int64_N131072_start(b *testing.B)      { benchmarkArrayListInsert_Int64(b, 131072, 0) }
func BenchmarkArrayListInsert_Int64_N131072_mid(b *testing.B)      { benchmarkArrayListInsert_Int64(b, 131072, 65536) }
func BenchmarkArrayListInsert_Int64_N131072_end(b *testing.B)      { benchmarkArrayListInsert_Int64(b, 131072, 131072) }

func fakeInsertString(arr []string, index int, value string) []string {
    result := make([]string, len(arr)+1)
    copy(result[:index], arr[:index])
    result[index] = value
    copy(result[index+1:], arr[index:])
    return result
}

func benchmarkArrayListInsert_String(b *testing.B, arrsize int, index int) {
	arr := make([]string, arrsize)
	for i:= 0; i < arrsize; i++ {
		arr[i] = "b"
	}
	for i := 0; i < b.N; i++ {	
		src_arr := arr
		src_arr = fakeInsertString(src_arr, index, "a")
	}
}

func BenchmarkArrayListInsert_String_N16_start(b *testing.B)      { benchmarkArrayListInsert_String(b, 16, 0) }
func BenchmarkArrayListInsert_String_N16_mid(b *testing.B)      { benchmarkArrayListInsert_String(b, 16, 8) }
func BenchmarkArrayListInsert_String_N16_end(b *testing.B)      { benchmarkArrayListInsert_String(b, 16, 16) }
func BenchmarkArrayListInsert_String_N256_start(b *testing.B)      { benchmarkArrayListInsert_String(b, 256, 0) }
func BenchmarkArrayListInsert_String_N256_mid(b *testing.B)      { benchmarkArrayListInsert_String(b, 256, 128) }
func BenchmarkArrayListInsert_String_N256_end(b *testing.B)      { benchmarkArrayListInsert_String(b, 256, 256) }
func BenchmarkArrayListInsert_String_N131072_start(b *testing.B)      { benchmarkArrayListInsert_String(b, 131072, 0) }
func BenchmarkArrayListInsert_String_N131072_mid(b *testing.B)      { benchmarkArrayListInsert_String(b, 131072, 65536) }
func BenchmarkArrayListInsert_String_N131072_end(b *testing.B)      { benchmarkArrayListInsert_String(b, 131072, 131072) }

func insertSlice(arr []int64, index int, slice []int64) []int64 {
    result := make([]int64, len(arr)+len(slice))
    copy(result, arr[:index])
    copy(result[index:], slice)
    copy(result[index+len(slice):], arr[index:])
    return result
}

func benchmarkArrayListInsertAll(b *testing.B, arrsize int, index int) {
	slice := make([]int64, arrsize)
	for i:= 0; i < arrsize; i++ {
		slice[i] = 1
	}
	arr_00 := make([]int64, arrsize)
	for i:= 0; i < arrsize; i++ {
		arr_00[i] = 0
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		arr := arr_00
		arr = insertSlice(arr, index, slice)
	}
}

func BenchmarkArrayListInsertAll_N16_start(b *testing.B)      { benchmarkArrayListInsertAll(b, 16, 0) }
func BenchmarkArrayListInsertAll_N16_mid(b *testing.B)      { benchmarkArrayListInsertAll(b, 16, 8) }
func BenchmarkArrayListInsertAll_N16_end(b *testing.B)      { benchmarkArrayListInsertAll(b, 16, 16) }
func BenchmarkArrayListInsertAll_N1024_start(b *testing.B)      { benchmarkArrayListInsertAll(b, 1024, 0) }
func BenchmarkArrayListInsertAll_N1024_mid(b *testing.B)      { benchmarkArrayListInsertAll(b, 1024, 512) }
func BenchmarkArrayListInsertAll_N1024_end(b *testing.B)      { benchmarkArrayListInsertAll(b, 1024, 1024) }
func BenchmarkArrayListInsertAll_N131072_start(b *testing.B)      { benchmarkArrayListInsertAll(b, 131072, 0) }
func BenchmarkArrayListInsertAll_N131072_mid(b *testing.B)      { benchmarkArrayListInsertAll(b, 131072, 65536) }
func BenchmarkArrayListInsertAll_N131072_end(b *testing.B)      { benchmarkArrayListInsertAll(b, 131072, 131072) }

func BenchmarkArrayListPrependInt64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		var arr []int64
		arr = append([]int64{1}, arr...)
	}
}

func BenchmarkArrayListPrependUInt8(b *testing.B) {
	for i := 0; i < b.N; i++ {
		var arr []byte
		arr = append([]byte{1}, arr...)
	}
}

func BenchmarkArrayListPrependFloat64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		var arr []float64
		arr = append([]float64{3.14}, arr...)
	}
}

func BenchmarkArrayListPrependBoolean(b *testing.B) {
	for i := 0; i < b.N; i++ {
		var arr []bool
		arr = append([]bool{true}, arr...)
	}
}

func BenchmarkArrayListPrependAll_N16(b *testing.B)      { benchmarkArrayListInsertAll(b, 16, 0) }
func BenchmarkArrayListPrependAll_N1024(b *testing.B)      { benchmarkArrayListInsertAll(b, 1024, 0) }
func BenchmarkArrayListPrependAll_N131072(b *testing.B)      { benchmarkArrayListInsertAll(b, 131072, 0) }

func benchmarkArrayListRemoveInt64(b *testing.B, index int) {
	for i := 0; i < b.N; i++ {
		arr := make([]int64, 256)
		for j := 0; j < 255; j++ {
			arr[j] = int64(j)
		}
		arr = append(arr[:index], arr[index+1:]...)
	}
}

func BenchmarkArrayListRemove_Int64_start(b *testing.B)    {benchmarkArrayListRemoveInt64(b, 0)}
func BenchmarkArrayListRemove_Int64_mid(b *testing.B)    {benchmarkArrayListRemoveInt64(b, 128)}
func BenchmarkArrayListRemove_Int64_end(b *testing.B)    {benchmarkArrayListRemoveInt64(b, 255)}

func benchmarkArrayListRemoveString(b *testing.B, index int) {
	for i := 0; i < b.N; i++ {
		arr := make([]string, 256)
		for j := 0; j < 256; j++ {
			arr[j] = "a"
		}
		arr = append(arr[:index], arr[index+1:]...)
	}
}

func BenchmarkArrayListRemove_String_start(b *testing.B)    {benchmarkArrayListRemoveString(b, 0)}
func BenchmarkArrayListRemove_String_mid(b *testing.B)    {benchmarkArrayListRemoveString(b, 128)}
func BenchmarkArrayListRemove_String_end(b *testing.B)    {benchmarkArrayListRemoveString(b, 255)}

// toArray , ToString 仅供参考
func BenchmarkArrayListToArray_N16(b *testing.B)      { benchmarkArrayList_Init_Capacity(b, 16) }
func BenchmarkArrayListToArray_N1024(b *testing.B)      { benchmarkArrayList_Init_Capacity(b, 1024) }
func BenchmarkArrayListToArray_N131072(b *testing.B)      { benchmarkArrayList_Init_Capacity(b, 131072) }

func BenchmarkArrayListToString_N16(b *testing.B)      { benchmarkArrayList_Init_Capacity(b, 16) }
func BenchmarkArrayListToString_N1024(b *testing.B)      { benchmarkArrayList_Init_Capacity(b, 1024) }
func BenchmarkArrayListToString_N131072(b *testing.B)      { benchmarkArrayList_Init_Capacity(b, 131072) }

var str string
func benchmarkArrayListGet(b *testing.B, arr_Size int) {
	arr := make([]string, arr_Size)
	for i := 0; i < arr_Size; i++ {
		arr[i] = "cj"
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		str = arr[arr_Size/2]
	}
}


var int_get int64
func benchmarkArrayListGet_Int64(b *testing.B, arr_Size int) {
	arr := make([]int64, arr_Size)
	for i := 0; i < arr_Size; i++ {
		arr[i] = int64(i)
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		int_get = arr[arr_Size/2]
	}
}

func BenchmarkArrayListBrackets_N16(b *testing.B)      { benchmarkArrayListGet(b, 16) }
func BenchmarkArrayListBrackets_N128(b *testing.B)      { benchmarkArrayListGet(b, 128) }
func BenchmarkArrayListBrackets_N1024(b *testing.B)      { benchmarkArrayListGet(b, 1024) }
func BenchmarkArrayListBrackets_N1048576(b *testing.B)      { benchmarkArrayListGet(b, 1048576) }

func BenchmarkArrayListBrackets_Int64_N16(b *testing.B)      { benchmarkArrayListGet_Int64(b, 16) }
func BenchmarkArrayListBrackets_Int64_N128(b *testing.B)      { benchmarkArrayListGet_Int64(b, 128) }
func BenchmarkArrayListBrackets_Int64_N1024(b *testing.B)      { benchmarkArrayListGet_Int64(b, 1024) }
func BenchmarkArrayListBrackets_Int64_N1048576(b *testing.B)      { benchmarkArrayListGet_Int64(b, 1048576) }

func benchmarkArrayListSet(b *testing.B, arr_Size int) {
	arr := make([]string, arr_Size)
	for i := 0; i < arr_Size; i++ {
		arr[i] = "cj"
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		arr[arr_Size/2] = "a"
	}
}

func benchmarkArrayListSet_Int64(b *testing.B, arr_Size int) {
	arr := make([]int64, arr_Size)
	for i := 0; i < arr_Size; i++ {
		arr[i] = int64(i)
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		arr[arr_Size/2] = 123
	}
}

func BenchmarkArrayListSet_N16(b *testing.B)      { benchmarkArrayListSet(b, 16) }
func BenchmarkArrayListSet_N128(b *testing.B)      { benchmarkArrayListSet(b, 128) }
func BenchmarkArrayListSet_N1024(b *testing.B)      { benchmarkArrayListSet(b, 1024) }
func BenchmarkArrayListSet_N1048576(b *testing.B)      { benchmarkArrayListSet(b, 1048576) }

func BenchmarkArrayListSet_Int64_N16(b *testing.B)      { benchmarkArrayListSet_Int64(b, 16) }
func BenchmarkArrayListSet_Int64_N128(b *testing.B)      { benchmarkArrayListSet_Int64(b, 128) }
func BenchmarkArrayListSet_Int64_N1024(b *testing.B)      { benchmarkArrayListSet_Int64(b, 1024) }
func BenchmarkArrayListSet_Int64_N1048576(b *testing.B)      { benchmarkArrayListSet_Int64(b, 1048576) }

func benchmarkArrayListClear(b *testing.B, arr_Size int) {
	arr := make([]int64, arr_Size)
	for i := 0; i < arr_Size; i++ {
		arr[i] = int64(i)
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for i := 0; i < arr_Size; i++ {
			arr[i] = 0
		}
	}
}

func BenchmarkArrayListClear_N16(b *testing.B)    { benchmarkArrayListClear(b, 16) }
func BenchmarkArrayListClear_N1024(b *testing.B)    { benchmarkArrayListClear(b, 1024) }
func BenchmarkArrayListClear_N131072(b *testing.B)    { benchmarkArrayListClear(b, 131072) }

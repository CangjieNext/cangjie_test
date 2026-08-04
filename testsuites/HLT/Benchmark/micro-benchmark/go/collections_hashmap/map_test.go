/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_hashmap

import (
	"math"
	"math/rand"
	"testing"
	"time"
)

const letterBytes = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

func randomString() string {
	b := make([]byte, 100)
	for i := range b {
		rand.Seed(time.Now().UnixNano())
		b[i] = letterBytes[rand.Intn(len(letterBytes))]
	}
	return string(b)
}

func deleteStringMapTarget(b *testing.B, size int64){
	length := int(math.Round(float64(size) * 0.7))
	arr := make([]string, length)
	for i := 0; i < length; i++ {
		rand.Seed(time.Now().UnixNano())
		str := randomString()
		arr[i] = str
	}
	b.ResetTimer()
	// b.StopTimer()
	for i := 0; i < b.N; i++ {
		hashmap := make(map[string]int64, length)
		for j := 0; j < length; j++ {
			hashmap[arr[j]] = 0
		}
		// b.StartTimer()
		for j := 0; j < length; j++ {
			delete(hashmap, arr[j])
		}
		// b.StopTimer()
	}
}

func BenchmarkHashMapRemove_16(b *testing.B) { deleteStringMapTarget(b, 16) }
func BenchmarkHashMapRemove_128(b *testing.B) { deleteStringMapTarget(b, 128) }
func BenchmarkHashMapRemove_1024(b *testing.B) { deleteStringMapTarget(b, 1024) }
func BenchmarkHashMapRemove_8192(b *testing.B) { deleteStringMapTarget(b, 8192) }
// time too long
func BenchmarkHashMapRemove_65536(b *testing.B) { deleteStringMapTarget(b, 65536) }
// func BenchmarkHashMapRemove_1048576(b *testing.B) { deleteStringMapTarget(b, 1048576) }

var map_datasize int
func benchmarkHashmapInit_Int64(b *testing.B, size int) {
	for i := 0; i < b.N; i++ {
		hashmap := make(map[int64]int64, size)
		map_datasize = len(hashmap)
	}
}

func benchmarkHashmapInit_String(b *testing.B, size int) {
	for i := 0; i < b.N; i++ {
		hashmap := make(map[string]int64, size)
		map_datasize = len(hashmap)
	}
}

func BenchmarkHashMapInitCapacity_Int64_N_16(b *testing.B)    {benchmarkHashmapInit_Int64(b, 16)}
func BenchmarkHashMapInitCapacity_Int64_N_128(b *testing.B)    {benchmarkHashmapInit_Int64(b, 128)}
func BenchmarkHashMapInitCapacity_Int64_N_1024(b *testing.B)    {benchmarkHashmapInit_Int64(b, 1024)}
func BenchmarkHashMapInitCapacity_Int64_N_8192(b *testing.B)    {benchmarkHashmapInit_Int64(b, 8192)}
func BenchmarkHashMapInitCapacity_Int64_N_65536(b *testing.B)    {benchmarkHashmapInit_Int64(b, 65536)}
func BenchmarkHashMapInitCapacity_Int64_N_1048576(b *testing.B)    {benchmarkHashmapInit_Int64(b, 1048576)}
func BenchmarkHashMapInitCapacity_String_N_16(b *testing.B)    {benchmarkHashmapInit_String(b, 16)}
func BenchmarkHashMapInitCapacity_String_N_128(b *testing.B)    {benchmarkHashmapInit_String(b, 128)}
func BenchmarkHashMapInitCapacity_String_N_1024(b *testing.B)    {benchmarkHashmapInit_String(b, 1024)}
func BenchmarkHashMapInitCapacity_String_N_8192(b *testing.B)    {benchmarkHashmapInit_String(b, 8192)}
func BenchmarkHashMapInitCapacity_String_N_65536(b *testing.B)    {benchmarkHashmapInit_String(b, 65536)}
func BenchmarkHashMapInitCapacity_String_N_1048576(b *testing.B)    {benchmarkHashmapInit_String(b, 1048576)}

// clone 仅提供基线, 亦无contains方法
func benchmarkHashMapClone(b *testing.B, size int) {
	for i := 0; i < b.N; i++ {
		hashmap := make(map[int64]int64, size)
		for j := 0; j < size; j++ {
			hashmap[int64(j)] = int64(j)
		}
	}
}

func BenchmarkHashMapClone_N_16(b *testing.B)    { benchmarkHashMapClone(b, 16) }
func BenchmarkHashMapClone_N_128(b *testing.B)    { benchmarkHashMapClone(b, 128) }
func BenchmarkHashMapClone_N_1024(b *testing.B)    { benchmarkHashMapClone(b, 1024) }
func BenchmarkHashMapClone_N_65536(b *testing.B)    { benchmarkHashMapClone(b, 65536) }

func benchmarkHashMapContains_Int64(b *testing.B, size int64) {
	length := int(math.Round(float64(size) * 0.7))
	arr := make([]int64, length)
	hashmap := make(map[int64]int64, length)
	for i := 0; i < length; i++ {
		rand.Seed(time.Now().UnixNano())
		element_0 := rand.Int63()
		arr[i] = element_0
		hashmap[element_0] = int64(i)
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j := 0; j < length; j++ {
			_, ok := hashmap[arr[j]]
			if !ok {
				b.Error()
			}
		}
	}
}

func BenchmarkHashMapContains_Int64_16(b *testing.B) { benchmarkHashMapContains_Int64(b, 16) }
func BenchmarkHashMapContains_Int64_128(b *testing.B) { benchmarkHashMapContains_Int64(b, 128) }
func BenchmarkHashMapContains_Int64_1024(b *testing.B) { benchmarkHashMapContains_Int64(b, 1024) }
func BenchmarkHashMapContains_Int64_8192(b *testing.B) { benchmarkHashMapContains_Int64(b, 8192) }
func BenchmarkHashMapContains_Int64_65536(b *testing.B) { benchmarkHashMapContains_Int64(b, 65536) }
func BenchmarkHashMapContains_Int64_1048576(b *testing.B) { benchmarkHashMapContains_Int64(b, 1048576) }

func BenchmarkHashMapGet_Int64_16(b *testing.B) { benchmarkHashMapContains_Int64(b, 16) }
func BenchmarkHashMapGet_Int64_128(b *testing.B) { benchmarkHashMapContains_Int64(b, 128) }
func BenchmarkHashMapGet_Int64_1024(b *testing.B) { benchmarkHashMapContains_Int64(b, 1024) }
func BenchmarkHashMapGet_Int64_8192(b *testing.B) { benchmarkHashMapContains_Int64(b, 8192) }
func BenchmarkHashMapGet_Int64_65536(b *testing.B) { benchmarkHashMapContains_Int64(b, 65536) }
func BenchmarkHashMapGet_Int64_1048576(b *testing.B) { benchmarkHashMapContains_Int64(b, 1048576) }

func benchmarkHashMapContains_Int64_NonExist(b *testing.B, size int64) {
	length := int(math.Round(float64(size) * 0.7))
	arr := make([]int64, length)
	hashmap := make(map[int64]int64, length)
	for i := 0; i < length; i++ {
		rand.Seed(time.Now().UnixNano())
		arr[i] = rand.Int63()
	}
	for i := 0; i < length; i++ {
		rand.Seed(time.Now().UnixNano() + 1)
		hashmap[rand.Int63()] = int64(i)
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j := 0; j < length; j++ {
			_, ok := hashmap[arr[j]]
			if ok {
				// b.Error()
			}
		}
	}
}

func BenchmarkHashMapContains_Int64_NonExist_16(b *testing.B) { benchmarkHashMapContains_Int64_NonExist(b, 16) }
func BenchmarkHashMapContains_Int64_NonExist_128(b *testing.B) { benchmarkHashMapContains_Int64_NonExist(b, 128) }
func BenchmarkHashMapContains_Int64_NonExist_1024(b *testing.B) { benchmarkHashMapContains_Int64_NonExist(b, 1024) }
func BenchmarkHashMapContains_Int64_NonExist_8192(b *testing.B) { benchmarkHashMapContains_Int64_NonExist(b, 8192) }
func BenchmarkHashMapContains_Int64_NonExist_65536(b *testing.B) { benchmarkHashMapContains_Int64_NonExist(b, 65536) }
func BenchmarkHashMapContains_Int64_NonExist_1048576(b *testing.B) { benchmarkHashMapContains_Int64_NonExist(b, 1048576) }

func benchmarkHashMapContains_Float64(b *testing.B, size int64) {
	length := int(math.Round(float64(size) * 0.7))
	arr := make([]float64, length)
	hashmap := make(map[float64]int64, length)
	for i := 0; i < length; i++ {
		rand.Seed(time.Now().UnixNano())
		element_0 := rand.Float64()
		arr[i] = element_0
		hashmap[element_0] = int64(i)
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j := 0; j < length; j++ {
			_, ok := hashmap[arr[j]]
			if !ok {
				b.Error()
			}
		}
	}
}

func BenchmarkHashMapContains_Float64_16(b *testing.B) { benchmarkHashMapContains_Float64(b, 16) }
func BenchmarkHashMapContains_Float64_128(b *testing.B) { benchmarkHashMapContains_Float64(b, 128) }
func BenchmarkHashMapContains_Float64_1024(b *testing.B) { benchmarkHashMapContains_Float64(b, 1024) }
func BenchmarkHashMapContains_Float64_8192(b *testing.B) { benchmarkHashMapContains_Float64(b, 8192) }
func BenchmarkHashMapContains_Float64_65536(b *testing.B) { benchmarkHashMapContains_Float64(b, 65536) }
func BenchmarkHashMapContains_Float64_1048576(b *testing.B) { benchmarkHashMapContains_Float64(b, 1048576) }

func BenchmarkHashMapGet_Float64_16(b *testing.B) { benchmarkHashMapContains_Float64(b, 16) }
func BenchmarkHashMapGet_Float64_128(b *testing.B) { benchmarkHashMapContains_Float64(b, 128) }
func BenchmarkHashMapGet_Float64_1024(b *testing.B) { benchmarkHashMapContains_Float64(b, 1024) }
func BenchmarkHashMapGet_Float64_8192(b *testing.B) { benchmarkHashMapContains_Float64(b, 8192) }
func BenchmarkHashMapGet_Float64_65536(b *testing.B) { benchmarkHashMapContains_Float64(b, 65536) }
func BenchmarkHashMapGet_Float64_1048576(b *testing.B) { benchmarkHashMapContains_Float64(b, 1048576) }

func benchmarkHashMapContains_Float64_NonExist(b *testing.B, size int64) {
	length := int(math.Round(float64(size) * 0.7))
	arr := make([]float64, length)
	hashmap := make(map[float64]int64, length)
	for i := 0; i < length; i++ {
		rand.Seed(time.Now().UnixNano())
		arr[i] = rand.Float64()
	}
	for i := 0; i < length; i++ {
		rand.Seed(time.Now().UnixNano())
		hashmap[rand.Float64()] = int64(i)
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j := 0; j < length; j++ {
			_, ok := hashmap[arr[j]]
			if ok {
				// b.Error()
			}
		}
	}
}

func BenchmarkHashMapContains_Float64_NonExist_16(b *testing.B) { benchmarkHashMapContains_Float64_NonExist(b, 16) }
func BenchmarkHashMapContains_Float64_NonExist_128(b *testing.B) { benchmarkHashMapContains_Float64_NonExist(b, 128) }
func BenchmarkHashMapContains_Float64_NonExist_1024(b *testing.B) { benchmarkHashMapContains_Float64_NonExist(b, 1024) }
func BenchmarkHashMapContains_Float64_NonExist_8192(b *testing.B) { benchmarkHashMapContains_Float64_NonExist(b, 8192) }
func BenchmarkHashMapContains_Float64_NonExist_65536(b *testing.B) { benchmarkHashMapContains_Float64_NonExist(b, 65536) }
func BenchmarkHashMapContains_Float64_NonExist_1048576(b *testing.B) { benchmarkHashMapContains_Float64_NonExist(b, 1048576) }

func benchmarkHashMapContains_String(b *testing.B, size int64) {
	length := int(math.Round(float64(size) * 0.7))
	arr := make([]string, length)
	hashmap := make(map[string]int64, length)
	for i := 0; i < length; i++ {
		str := randomString()
		arr[i] = str
		hashmap[str] = int64(i)
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j := 0; j < length; j++ {
			_, ok := hashmap[arr[j]]
			if !ok {
				b.Error()
			}
		}
	}
}

func BenchmarkHashMapContains_String_16(b *testing.B) { benchmarkHashMapContains_String(b, 16) }
func BenchmarkHashMapContains_String_128(b *testing.B) { benchmarkHashMapContains_String(b, 128) }
func BenchmarkHashMapContains_String_1024(b *testing.B) { benchmarkHashMapContains_String(b, 1024) }
func BenchmarkHashMapContains_String_8192(b *testing.B) { benchmarkHashMapContains_String(b, 8192) }
// func BenchmarkHashMapContains_String_65536(b *testing.B) { benchmarkHashMapContains_String(b, 65536) }
// func BenchmarkHashMapContains_String_1048576(b *testing.B) { benchmarkHashMapContains_String(b, 1048576) }

func BenchmarkHashMapGet_String_16(b *testing.B) { benchmarkHashMapContains_String(b, 16) }
func BenchmarkHashMapGet_String_128(b *testing.B) { benchmarkHashMapContains_String(b, 128) }
func BenchmarkHashMapGet_String_1024(b *testing.B) { benchmarkHashMapContains_String(b, 1024) }
func BenchmarkHashMapGet_String_8192(b *testing.B) { benchmarkHashMapContains_String(b, 8192) }
// func BenchmarkHashMapGet_String_65536(b *testing.B) { benchmarkHashMapContains_String(b, 65536) }
// func BenchmarkHashMapGet_String_1048576(b *testing.B) { benchmarkHashMapContains_String(b, 1048576) }

func benchmarkHashMapContains_String_NonExist(b *testing.B, size int64) {
	length := int(math.Round(float64(size) * 0.7))
	arr := make([]string, length)
	hashmap := make(map[string]int64, length)
	for i := 0; i < length; i++ {
		str := randomString()
		arr[i] = str
	}
	for i := 0; i < length; i++ {
		str := randomString()
		hashmap[str] = int64(i)
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j := 0; j < length; j++ {
			_, ok := hashmap[arr[j]]
			if ok {
				// b.Error()
			}
		}
	}
}

func BenchmarkHashMapContains_String_NonExist_16(b *testing.B) { benchmarkHashMapContains_String_NonExist(b, 16) }
func BenchmarkHashMapContains_String_NonExist_128(b *testing.B) { benchmarkHashMapContains_String_NonExist(b, 128) }
func BenchmarkHashMapContains_String_NonExist_1024(b *testing.B) { benchmarkHashMapContains_String_NonExist(b, 1024) }
func BenchmarkHashMapContains_String_NonExist_8192(b *testing.B) { benchmarkHashMapContains_String_NonExist(b, 8192) }
// func BenchmarkHashMapContains_String_NonExist_65536(b *testing.B) { benchmarkHashMapContains_String_NonExist(b, 65536) }
// time too long
// func BenchmarkHashMapContains_String_NonExist_1048576(b *testing.B) { benchmarkHashMapContains_String_NonExist(b, 1048576) }

func benchmarkHashMapPut_Int64(b *testing.B, size int64) {
	length := int(math.Round(float64(size) * 0.7))
	arr := make([]int64, length)
	for i := 0; i < length; i++ {
		rand.Seed(time.Now().UnixNano())
		element_0 := rand.Int63()
		arr[i] = element_0
	}
	b.ResetTimer()
	// 注释下的写法执行时间太长
	// b.StopTimer()
	for i := 0; i < b.N; i++ {
		hashmap := make(map[int64]int64, length)
		// b.StartTimer()
		for j := 0; j < length; j++ {
			hashmap[arr[j]] = 0
		}
		// b.StopTimer()
	}
}

func BenchmarkHashMapPut_Int64_16(b *testing.B) { benchmarkHashMapPut_Int64(b, 16) }
func BenchmarkHashMapPut_Int64_128(b *testing.B) { benchmarkHashMapPut_Int64(b, 128) }
func BenchmarkHashMapPut_Int64_1024(b *testing.B) { benchmarkHashMapPut_Int64(b, 1024) }
func BenchmarkHashMapPut_Int64_8192(b *testing.B) { benchmarkHashMapPut_Int64(b, 8192) }
func BenchmarkHashMapPut_Int64_65536(b *testing.B) { benchmarkHashMapPut_Int64(b, 65536) }
func BenchmarkHashMapPut_Int64_1048576(b *testing.B) { benchmarkHashMapPut_Int64(b, 1048576) }

func benchmarkHashMapPut_Float64(b *testing.B, size int64) {
	length := int(math.Round(float64(size) * 0.7))
	arr := make([]float64, length)
	for i := 0; i < length; i++ {
		rand.Seed(time.Now().UnixNano())
		element_0 := rand.Float64()
		arr[i] = element_0
	}
	b.ResetTimer()
	// 注释下的写法执行时间太长
	// b.StopTimer()
	for i := 0; i < b.N; i++ {
		hashmap := make(map[float64]int64, length)
		// b.StartTimer()
		for j := 0; j < length; j++ {
			hashmap[arr[j]] = 0
		}
		// b.StopTimer()
	}
}

func BenchmarkHashMapPut_Float64_16(b *testing.B) { benchmarkHashMapPut_Float64(b, 16) }
func BenchmarkHashMapPut_Float64_128(b *testing.B) { benchmarkHashMapPut_Float64(b, 128) }
func BenchmarkHashMapPut_Float64_1024(b *testing.B) { benchmarkHashMapPut_Float64(b, 1024) }
func BenchmarkHashMapPut_Float64_8192(b *testing.B) { benchmarkHashMapPut_Float64(b, 8192) }
func BenchmarkHashMapPut_Float64_65536(b *testing.B) { benchmarkHashMapPut_Float64(b, 65536) }
func BenchmarkHashMapPut_Float64_1048576(b *testing.B) { benchmarkHashMapPut_Float64(b, 1048576) }

func benchmarkHashMapPut_String(b *testing.B, size int64) {
	length := int(math.Round(float64(size) * 0.7))
	arr := make([]string, length)
	for i := 0; i < length; i++ {
		rand.Seed(time.Now().UnixNano())
		str := randomString()
		arr[i] = str
	}
	b.ResetTimer()
	// 注释下的写法执行时间太长
	// b.StopTimer()
	for i := 0; i < b.N; i++ {
		hashmap := make(map[string]int64, length)
		// b.StartTimer()
		for j := 0; j < length; j++ {
			hashmap[arr[j]] = 0
		}
		// b.StopTimer()
	}
}

func BenchmarkHashMapPut_String_16(b *testing.B) { benchmarkHashMapPut_String(b, 16) }
func BenchmarkHashMapPut_String_128(b *testing.B) { benchmarkHashMapPut_String(b, 128) }
func BenchmarkHashMapPut_String_1024(b *testing.B) { benchmarkHashMapPut_String(b, 1024) }
func BenchmarkHashMapPut_String_8192(b *testing.B) { benchmarkHashMapPut_String(b, 8192) }
// time too long
// func BenchmarkHashMapPut_String_65536(b *testing.B) { benchmarkHashMapPut_String(b, 65536) }
// func BenchmarkHashMapPut_String_1048576(b *testing.B) { benchmarkHashMapPut_String(b, 1048576) }

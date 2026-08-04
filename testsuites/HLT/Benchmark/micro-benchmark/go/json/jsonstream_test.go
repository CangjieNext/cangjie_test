/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package json_test

/* golang 中无对应接口，仅做场景模拟
   golang 标准库中 Marshal & Unmarshal使用了反射，性能较差
*/

import (
	"encoding/json"
	"strings"
	"testing"
)

func benchmarkReadString(b *testing.B, n int) {
	var out string
	str := "[" + strings.Repeat("a", n) + "]"
	jsonstr, err := json.Marshal(str)
	if err != nil {
		panic(err)
	}

	b.ResetTimer()
	for i := 0; i < 10 * b.N; i++ {
		err := json.Unmarshal([]byte(jsonstr), &out)
		if err != nil {
			panic(err)
		}
	}
}

func BenchmarkJsonReadString_G10_4(b *testing.B)    { benchmarkReadString(b, 4) }
func BenchmarkJsonReadString_G10_8(b *testing.B)    { benchmarkReadString(b, 8) }
func BenchmarkJsonReadString_G10_16(b *testing.B)    { benchmarkReadString(b, 16) }
func BenchmarkJsonReadString_G10_64(b *testing.B)    { benchmarkReadString(b, 64) }
func BenchmarkJsonReadString_G10_256(b *testing.B)    { benchmarkReadString(b, 256) }
func BenchmarkJsonReadString_G10_1024(b *testing.B)    { benchmarkReadString(b, 1024) }
func BenchmarkJsonReadString_G10_4096(b *testing.B)    { benchmarkReadString(b, 4096) }
func BenchmarkJsonReadString_G10_16384(b *testing.B)    { benchmarkReadString(b, 16384) }
func BenchmarkJsonReadString_G10_131072(b *testing.B)    { benchmarkReadString(b, 131072) }

func benchmarkWriteString(b *testing.B, n int) {
	str := "[" + strings.Repeat("B", n) + "]"
	b.ResetTimer()
	for i := 0; i < 10 * b.N; i++ {
		_, err := json.Marshal(str)
		if err != nil {
			panic(err)
		}
	}
}

func BenchmarkJsonWriteString_G10_4(b *testing.B)    { benchmarkWriteString(b, 4) }
func BenchmarkJsonWriteString_G10_8(b *testing.B)    { benchmarkWriteString(b, 8) }
func BenchmarkJsonWriteString_G10_16(b *testing.B)    { benchmarkWriteString(b, 16) }
func BenchmarkJsonWriteString_G10_64(b *testing.B)    { benchmarkWriteString(b, 64) }
func BenchmarkJsonWriteString_G10_256(b *testing.B)    { benchmarkWriteString(b, 256) }
func BenchmarkJsonWriteString_G10_1024(b *testing.B)    { benchmarkWriteString(b, 1024) }
func BenchmarkJsonWriteString_G10_4096(b *testing.B)    { benchmarkWriteString(b, 4096) }
func BenchmarkJsonWriteString_G10_16384(b *testing.B)    { benchmarkWriteString(b, 16384) }
func BenchmarkJsonWriteString_G10_131072(b *testing.B)    { benchmarkWriteString(b, 131072) }

func BenchmarkJsonWriteInt64_G10(b *testing.B) {
	for i := 0; i < 10 * b.N; i++ {
		_, err := json.Marshal(int64(1000000))
		if err != nil {
			panic(err)
		}
	}
}

func BenchmarkJsonReadInt64_G10(b *testing.B) {
	var out int64
	jsonint, err := json.Marshal(int64(1000000))
	if err != nil {
		panic(err)
	}
	b.ResetTimer()
	for i := 0; i < 10 * b.N; i++ {
		err := json.Unmarshal([]byte(jsonint), &out)
		if err != nil {
			panic(err)
		}
	}
}

func BenchmarkJsonWriteFloat64_G10(b *testing.B) {
	for i := 0; i < 10 * b.N; i++ {
		_, err := json.Marshal(float64(1.23456))
		if err != nil {
			panic(err)
		}
	}
}

func BenchmarkJsonReadFloat64_G10(b *testing.B) {
	var out float64
	jsonfloat, err := json.Marshal(float64(1.23456))
	if err != nil {
		panic(err)
	}
	b.ResetTimer()
	for i := 0; i < 10 * b.N; i++ {
		err := json.Unmarshal([]byte(jsonfloat), &out)
		if err != nil {
			panic(err)
		}
	}
}

func BenchmarkJsonWriteBool_G10(b *testing.B) {
	for i := 0; i < 10 * b.N; i++ {
		_, err := json.Marshal(true)
		if err != nil {
			panic(err)
		}
	}
}

func BenchmarkJsonReadBool_G10(b *testing.B) {
	var out bool
	jsonbool, err := json.Marshal(false)
	if err != nil {
		panic(err)
	}
	b.ResetTimer()
	for i := 0; i < 10 * b.N; i++ {
		err := json.Unmarshal([]byte(jsonbool), &out)
		if err != nil {
			panic(err)
		}
	}
}

func BenchmarkJsonWriteNull_G10(b *testing.B) {
	for i := 0; i < 10 * b.N; i++ {
		_, err := json.Marshal(nil)
		if err != nil {
			panic(err)
		}
	}
}

func BenchmarkJsonReadNull_G10(b *testing.B) {
	var out string
	jsonnull, err := json.Marshal(nil)
	if err != nil {
		panic(err)
	}
	b.ResetTimer()
	for i := 0; i < 10 * b.N; i++ {
		err := json.Unmarshal([]byte(jsonnull), &out)
		if err != nil {
			panic(err)
		}
	}
}
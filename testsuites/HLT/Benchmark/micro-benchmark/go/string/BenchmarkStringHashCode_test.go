/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package string_test

import (
	"testing"
	"strings"
	"hash/fnv"
)


func BenchmarkStringHashCode_N8(b *testing.B){
	str := strings.Repeat("H", 8)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res := fnv.New32a()
		res.Write([]byte(str))
	}
}

func BenchmarkStringHashCode_N32(b *testing.B){
	str := strings.Repeat("H", 32)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res := fnv.New32a()
		res.Write([]byte(str))
	}
}

func BenchmarkStringHashCode_N256(b *testing.B){
	str := strings.Repeat("H", 256)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res := fnv.New32a()
		res.Write([]byte(str))
	}
}

func BenchmarkStringHashCode_N1k(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res := fnv.New32a()
		res.Write([]byte(str))
	}
}
func BenchmarkStringHashCode_N1m(b *testing.B){
	str := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res := fnv.New32a()
		res.Write([]byte(str))
	}
}
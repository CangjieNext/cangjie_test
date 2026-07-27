/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package convert

import (
	"testing"
	"strconv"
)

func BenchmarkStr2Int8(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseInt("100", 10, 8)
	}
	
}

func BenchmarkStr2Int16(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseInt("100", 10, 16)
	}
	
}

func BenchmarkStr2Int32(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseInt("100", 10, 32)
	}
	
}

func BenchmarkStr2Int64(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseInt("100", 10, 64)
	}
	
}


func BenchmarkStr2UInt8(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseUint("100", 10, 8)
	}
	
}

func BenchmarkStr2UInt16(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseUint("100", 10, 16)
	}
	
}

func BenchmarkStr2UInt32(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseUint("100", 10, 32)
	}
	
}

func BenchmarkStr2UInt64(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseUint("100", 10, 64)
	}
	
}

func BenchmarkStr2Float16(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseFloat("100.100", 16)
	}
	
}
func BenchmarkStr2Float32(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseFloat("100.100", 32)
	}
	
}
func BenchmarkStr2Float64(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseFloat("100.100", 64)
	}
	
}

func BenchmarkStr2Bool_true(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseBool("true")
	}
}

func BenchmarkStr2Bool_false(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.ParseBool("false")
	}
}

func BenchmarkStr2Char(b *testing.B) {
	for i := b.N-1; i >= 0; i-- {
		 strconv.Unquote("'a'")
	}
}
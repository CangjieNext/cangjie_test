/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package io

import (
	"bufio"
	"os"
	"testing"
	"io"
	"io/ioutil"
)

func count_by_1(filename string) int {
	file, err := os.Open(filename)
	if err != nil {
		panic(err)
	}
	fileReader := bufio.NewReader(file)
	count := 0
    for { 
        _, num, err := fileReader.ReadRune() 
        if err != nil && err != io.EOF{ 
            panic(err) 
        }
        if num == 0 { 
            break 
        }
		count++
    }
	return count
}

func benchmarkReadUTF8_count_by_1(b *testing.B, filename string) {
	for i := 0; i < b.N; i++ {
		count_by_1(filename)
	}
}

func BenchmarkReadUTF8_count_by_1_galsworthy(b *testing.B)   { benchmarkReadUTF8_count_by_1(b, "galsworthy.txt") }
func BenchmarkReadUTF8_count_by_1_guanzhongluo(b *testing.B)   { benchmarkReadUTF8_count_by_1(b, "guanzhongluo.txt") }
func BenchmarkReadUTF8_count_by_1_tolstoy(b *testing.B)   { benchmarkReadUTF8_count_by_1(b, "tolstoy.txt") }

func count_lines(filename string) int {
	file, err := os.Open(filename)
	if err != nil {
		panic(err)
	}
	fileReader := bufio.NewReader(file)
	count := 0
    for {
		// go 不推荐 ReadLine
        byte, err := fileReader.ReadBytes('\n')
        if err != nil && err != io.EOF{
            panic(err) 
        }
		num := len(byte)
        if num == 0 {
            break
        }
		count += num
    }
	return count
}

func benchmarkReadUTF8_count_lines(b *testing.B, filename string) {
	for i := 0; i < b.N; i++ {
		count_lines(filename)
	}
}

func BenchmarkReadUTF8_count_lines_galsworthy(b *testing.B)   { benchmarkReadUTF8_count_lines(b, "galsworthy.txt") }
func BenchmarkReadUTF8_count_lines_guanzhongluo(b *testing.B)   { benchmarkReadUTF8_count_lines(b, "guanzhongluo.txt") }
func BenchmarkReadUTF8_count_lines_tolstoy(b *testing.B)   { benchmarkReadUTF8_count_lines(b, "tolstoy.txt") }

func count_all(filename string) int {
	file, err := os.Open(filename)
	if err != nil {
		panic(err)
	}
	byte, _ := ioutil.ReadAll(file)
	return len(byte)
}

func benchmarkReadUTF8_count_all(b *testing.B, filename string) {
	for i := 0; i < b.N; i++ {
		count_all(filename)
	}
}

func BenchmarkReadUTF8_count_all_galsworthy(b *testing.B)   { benchmarkReadUTF8_count_all(b, "galsworthy.txt") }
func BenchmarkReadUTF8_count_all_guanzhongluo(b *testing.B)   { benchmarkReadUTF8_count_all(b, "guanzhongluo.txt") }
func BenchmarkReadUTF8_count_all_tolstoy(b *testing.B)   { benchmarkReadUTF8_count_all(b, "tolstoy.txt") }

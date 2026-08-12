/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package old_json_test

import (
	"encoding/json"
	"io/ioutil"
	"os"
	"path"
	"testing"
)

func benchmarkJsonArray2JsonStr(b *testing.B, n int) {
	val := make([]int, n)
	for j := 0; j < n; j++ {
		val[j] = j
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err := json.MarshalIndent(val, "  ", "")
		if err != nil {
			b.Error(err)
		}
	}
}

func BenchmarkJsonArray2JsonStrN8(b *testing.B)    { benchmarkJsonArray2JsonStr(b, 8) }
func BenchmarkJsonArray2JsonStrN64(b *testing.B)   { benchmarkJsonArray2JsonStr(b, 64) }
func BenchmarkJsonArray2JsonStrN512(b *testing.B)  { benchmarkJsonArray2JsonStr(b, 512) }
func BenchmarkJsonArray2JsonStrN4096(b *testing.B) { benchmarkJsonArray2JsonStr(b, 4096) }

func BenchmarkJsonBool2JsonStr(b *testing.B) {
	val := true
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err := json.MarshalIndent(val, "  ", "")
		if err != nil {
			b.Error(err)
		}
	}
}

func BenchmarkJsonFloat2JsonStr(b *testing.B) {
	val := 3.14
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err := json.MarshalIndent(val, "  ", "")
		if err != nil {
			b.Error(err)
		}
	}
}

func BenchmarkJsonInt2JsonStr(b *testing.B) {
	val := 3
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err := json.MarshalIndent(val, "  ", "")
		if err != nil {
			b.Error(err)
		}
	}
}

func BenchmarkJsonNull2JsonStr(b *testing.B) {
	var val *int = nil
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err := json.MarshalIndent(val, "  ", "")
		if err != nil {
			b.Error(err)
		}
	}
}

type Data struct {
	value1 bool
	value2 int32
	value3 float32
	value4 string
}

func BenchmarkJsonObject2JsonStr(b *testing.B) {
	val := Data{
		value1: true,
		value2: 3,
		value3: 3.14,
		value4: "abc",
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err := json.MarshalIndent(val, "  ", "")
		if err != nil {
			b.Error(err)
		}
	}
}

func BenchmarkJsonString2JsonStr(b *testing.B) {
	val := "abc"
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err := json.MarshalIndent(val, "  ", "")
		if err != nil {
			b.Error(err)
		}
	}
}

const dataPath = "../../script/data/json"

func benchmarkJsonValue2JsonStr(b *testing.B, tag string) {
	jsonFile, err := os.Open(path.Join(dataPath, tag+".json"))
	if err != nil {
		b.Error(err)
	}
	defer jsonFile.Close()
	byteValue, _ := ioutil.ReadAll(jsonFile)
	var val interface{}
	err = json.Unmarshal(byteValue, &val)
	if err != nil {
		b.Error(err)
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err := json.MarshalIndent(val, "  ", "")
		if err != nil {
			b.Error(err)
		}
	}
}

func BenchmarkJsonValue2JsonStrn8d1(b *testing.B)   { benchmarkJsonValue2JsonStr(b, "n8d1") }
func BenchmarkJsonValue2JsonStrn8d2(b *testing.B)   { benchmarkJsonValue2JsonStr(b, "n8d2") }
func BenchmarkJsonValue2JsonStrn8d4(b *testing.B)   { benchmarkJsonValue2JsonStr(b, "n8d4") }
func BenchmarkJsonValue2JsonStrn8d8(b *testing.B)   { benchmarkJsonValue2JsonStr(b, "n8d8") }
func BenchmarkJsonValue2JsonStrn64d1(b *testing.B)  { benchmarkJsonValue2JsonStr(b, "n64d1") }
func BenchmarkJsonValue2JsonStrn64d2(b *testing.B)  { benchmarkJsonValue2JsonStr(b, "n64d2") }
func BenchmarkJsonValue2JsonStrn64d4(b *testing.B)  { benchmarkJsonValue2JsonStr(b, "n64d4") }
func BenchmarkJsonValue2JsonStrn64d8(b *testing.B)  { benchmarkJsonValue2JsonStr(b, "n64d8") }
func BenchmarkJsonValue2JsonStrn512d1(b *testing.B) { benchmarkJsonValue2JsonStr(b, "n512d1") }
func BenchmarkJsonValue2JsonStrn512d2(b *testing.B) { benchmarkJsonValue2JsonStr(b, "n512d2") }
func BenchmarkJsonValue2JsonStrn512d4(b *testing.B) { benchmarkJsonValue2JsonStr(b, "n512d4") }

func benchmarkStr2JsonValue(b *testing.B, tag string) {
	jsonFile, err := os.Open(path.Join(dataPath, tag+".json"))
	if err != nil {
		b.Error(err)
	}
	defer jsonFile.Close()
	val, _ := ioutil.ReadAll(jsonFile)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		var jv interface{}
		err := json.Unmarshal(val, &jv)
		if err != nil {
			b.Error(err)
		}
	}
}

func BenchmarkStr2JsonValuen8d1(b *testing.B)   { benchmarkStr2JsonValue(b, "n8d1") }
func BenchmarkStr2JsonValuen8d2(b *testing.B)   { benchmarkStr2JsonValue(b, "n8d2") }
func BenchmarkStr2JsonValuen8d4(b *testing.B)   { benchmarkStr2JsonValue(b, "n8d4") }
func BenchmarkStr2JsonValuen8d8(b *testing.B)   { benchmarkStr2JsonValue(b, "n8d8") }
func BenchmarkStr2JsonValuen64d1(b *testing.B)  { benchmarkStr2JsonValue(b, "n64d1") }
func BenchmarkStr2JsonValuen64d2(b *testing.B)  { benchmarkStr2JsonValue(b, "n64d2") }
func BenchmarkStr2JsonValuen64d4(b *testing.B)  { benchmarkStr2JsonValue(b, "n64d4") }
func BenchmarkStr2JsonValuen64d8(b *testing.B)  { benchmarkStr2JsonValue(b, "n64d8") }
func BenchmarkStr2JsonValuen512d1(b *testing.B) { benchmarkStr2JsonValue(b, "n512d1") }
func BenchmarkStr2JsonValuen512d2(b *testing.B) { benchmarkStr2JsonValue(b, "n512d2") }
func BenchmarkStr2JsonValuen512d4(b *testing.B) { benchmarkStr2JsonValue(b, "n512d4") }

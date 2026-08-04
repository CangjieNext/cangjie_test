/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package http_test_test

import (
	"bytes"
	"context"
	"errors"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"crypto/tls"
	"strconv"
	"strings"
	"testing"
	"time"
)

type handler struct{}

func (h *handler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	v := r.URL.Query()
	receiveSizeStr := v.Get("receiveSize")
	receiveSize, err := strconv.Atoi(receiveSizeStr)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	isFormStr := v.Get("isForm")
	isForm, err := strconv.ParseBool(isFormStr)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	if isForm {
		r.ParseForm()
	}

	w.WriteHeader(http.StatusOK)
	data := make([]byte, receiveSize)
	if _, e := w.Write(data); e != nil {
		panic(e)
	}
}

var port int = 61111

func init() {
	server := http.Server{
		Addr:    "0.0.0.0:61111",
		Handler: &handler{},
	}

	go func() {
		err := server.ListenAndServeTLS("data/end_rsa.cer", "data/end_rsa_private_key.pem")
		if err != nil {
			panic(err)
			return
		}
	}()
}

func request(b *testing.B, method string, sendSize int, receiveSize int, isForm bool) {
	if method == http.MethodGet && sendSize != 0 {
		b.Error(fmt.Errorf("invalid %s request: sendSize %d", method, sendSize))
		return
	}
	if method == http.MethodHead && ( sendSize != 0 || receiveSize != 0) {
		b.Error(fmt.Errorf("invalid %s request: sendSize %d, receiveSize %d", method, sendSize, receiveSize))
		return
	}
	data := make([]byte, sendSize)
	for i := 0; i < sendSize; i++ {
		data[i] = 'a'
	}
	var bodyStr string
	if isForm {
		var r http.Request
		err := r.ParseForm()
		if err != nil {
			b.Error(err)
			return
		}
		r.Form.Add("key", string(data))
		bodyStr = strings.TrimSpace(r.Form.Encode())
	}
	url := fmt.Sprintf("https://localhost:%d?receiveSize=%d&isForm=%v", port, receiveSize, isForm)

	tr := &http.Transport{
		TLSClientConfig:   &tls.Config{InsecureSkipVerify: true},
	}
	client := &http.Client{
		Transport: tr,
		Timeout: time.Minute,
	}

	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if doRequest(b, client, method, isForm, bodyStr, data, url, receiveSize) {
			return
		}
	}
}

func doRequest(b *testing.B, client *http.Client, method string, isForm bool, bodyStr string, data []byte, url string, receiveSize int) bool {
	var body io.Reader = nil
	if isForm {
		body = strings.NewReader(bodyStr)
	} else {
		body = bytes.NewReader(data)
	}
	request, err := http.NewRequest(method, url, body)
	if err != nil {
		b.Error(err)
		return true
	}
	ctx, cancelFunc := context.WithCancel(context.Background())
	request = request.WithContext(ctx)
	if isForm {
		request.Header.Set("Content-Type", "application/x-www-form-urlencoded")
	}
	resp, err := client.Do(request)
	if err != nil {
		b.Error(err)
		return true
	}
	defer cancelFunc()
	if resp.StatusCode != http.StatusOK {
		b.Error(errors.New("invalid status: " + resp.Status))
		return true
	}
	respData, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		b.Error(err)
		return true
	}
	if len(respData) != receiveSize {
		b.Error(fmt.Errorf("invalid receiveSize: expected %d, actual %d", receiveSize, int64(len(respData))))
		return true
	}
	return false
}

func BenchmarkHttpsGet0_32(b *testing.B) { request(b, http.MethodGet, 0, 32, false) }
func BenchmarkHttpsGet0_256(b *testing.B) { request(b, http.MethodGet, 0, 256, false) }
func BenchmarkHttpsGet0_2K(b *testing.B) { request(b, http.MethodGet, 0, 2*1024, false) }
func BenchmarkHttpsGet0_16K(b *testing.B) { request(b, http.MethodGet, 0, 16*1024, false) }
func BenchmarkHttpsGet0_128K(b *testing.B) { request(b, http.MethodGet, 0, 128*1024, false) }
func BenchmarkHttpsGet0_1M(b *testing.B) { request(b, http.MethodGet, 0, 1024*1024, false) }
func BenchmarkHttpsGet0_8M(b *testing.B) { request(b, http.MethodGet, 0, 8*1024*1024, false) }
func BenchmarkHttpsGet0_64M(b *testing.B) { request(b, http.MethodGet, 0, 64*1024*1024, false) }
func BenchmarkHttpsGet0_512M(b *testing.B) { request(b, http.MethodGet, 0, 512*1024*1024, false) }
func BenchmarkHttpsGet0_4G(b *testing.B) { request(b, http.MethodGet, 0, 4*1024*1024*1024, false) }

func BenchmarkHttpsHead(b *testing.B) { request(b, http.MethodHead, 0, 0, false) }

func BenchmarkHttpsDelete(b *testing.B) { request(b, http.MethodDelete, 0, 0, true) }

func BenchmarkHttpsPost0_32(b *testing.B) { request(b, http.MethodPost, 0, 32, false) }
func BenchmarkHttpsPost0_256(b *testing.B) { request(b, http.MethodPost, 0, 256, false) }
func BenchmarkHttpsPost0_2K(b *testing.B) { request(b, http.MethodPost, 0, 2*1024, false) }
func BenchmarkHttpsPost0_16K(b *testing.B) { request(b, http.MethodPost, 0, 16*1024, false) }
func BenchmarkHttpsPost0_128K(b *testing.B) { request(b, http.MethodPost, 0, 128*1024, false) }
func BenchmarkHttpsPost0_1M(b *testing.B) { request(b, http.MethodPost, 0, 1024*1024, false) }
func BenchmarkHttpsPost0_8M(b *testing.B) { request(b, http.MethodPost, 0, 8*1024*1024, false) }
func BenchmarkHttpsPost0_64M(b *testing.B) { request(b, http.MethodPost, 0, 64*1024*1024, false) }
func BenchmarkHttpsPost0_512M(b *testing.B) { request(b, http.MethodPost, 0, 512*1024*1024, false) }
func BenchmarkHttpsPost0_4G(b *testing.B) { request(b, http.MethodPost, 0, 4*1024*1024*1024, false) }

func BenchmarkHttpsPost32_0(b *testing.B) { request(b, http.MethodPost, 32, 0, false) }
func BenchmarkHttpsPost256_0(b *testing.B) { request(b, http.MethodPost, 256, 0, false) }
func BenchmarkHttpsPost2K_0(b *testing.B) { request(b, http.MethodPost, 2*1024, 0, false) }
func BenchmarkHttpsPost16K_0(b *testing.B) { request(b, http.MethodPost, 16*1024, 0, false) }
func BenchmarkHttpsPost128K_0(b *testing.B) { request(b, http.MethodPost, 128*1024, 0, false) }
func BenchmarkHttpsPost1M_0(b *testing.B) { request(b, http.MethodPost,1024*1024, 0,  false) }
func BenchmarkHttpsPost8M_0(b *testing.B) { request(b, http.MethodPost,8*1024*1024, 0,  false) }
func BenchmarkHttpsPost64M_0(b *testing.B) { request(b, http.MethodPost, 64*1024*1024, 0, false) }
func BenchmarkHttpsPost512M_0(b *testing.B) { request(b, http.MethodPost, 512*1024*1024, 0, false) }
func BenchmarkHttpsPost4G_0(b *testing.B) { request(b, http.MethodPost, 4*1024*1024*1024, 0, false) }

func BenchmarkHttpsPut0_32(b *testing.B) { request(b, http.MethodPut, 0, 32, false) }
func BenchmarkHttpsPut0_256(b *testing.B) { request(b, http.MethodPut, 0, 256, false) }
func BenchmarkHttpsPut0_2K(b *testing.B) { request(b, http.MethodPut, 0, 2*1024, false) }
func BenchmarkHttpsPut0_16K(b *testing.B) { request(b, http.MethodPut, 0, 16*1024, false) }
func BenchmarkHttpsPut0_128K(b *testing.B) { request(b, http.MethodPut, 0, 128*1024, false) }
func BenchmarkHttpsPut0_1M(b *testing.B) { request(b, http.MethodPut, 0, 1024*1024, false) }
func BenchmarkHttpsPut0_8M(b *testing.B) { request(b, http.MethodPut, 0, 8*1024*1024, false) }
func BenchmarkHttpsPut0_64M(b *testing.B) { request(b, http.MethodPut, 0, 64*1024*1024, false) }
func BenchmarkHttpsPut0_512M(b *testing.B) { request(b, http.MethodPut, 0, 512*1024*1024, false) }
func BenchmarkHttpsPut0_4G(b *testing.B) { request(b, http.MethodPut, 0, 4*1024*1024*1024, false) }

func BenchmarkHttpsPut32_0(b *testing.B) { request(b, http.MethodPut, 32, 0, false) }
func BenchmarkHttpsPut256_0(b *testing.B) { request(b, http.MethodPut, 256, 0, false) }
func BenchmarkHttpsPut2K_0(b *testing.B) { request(b, http.MethodPut, 2*1024, 0, false) }
func BenchmarkHttpsPut16K_0(b *testing.B) { request(b, http.MethodPut, 16*1024, 0, false) }
func BenchmarkHttpsPut128K_0(b *testing.B) { request(b, http.MethodPut, 128*1024, 0, false) }
func BenchmarkHttpsPut1M_0(b *testing.B) { request(b, http.MethodPut,1024*1024, 0,  false) }
func BenchmarkHttpsPut8M_0(b *testing.B) { request(b, http.MethodPut,8*1024*1024, 0,  false) }
func BenchmarkHttpsPut64M_0(b *testing.B) { request(b, http.MethodPut, 64*1024*1024, 0, false) }
func BenchmarkHttpsPut512M_0(b *testing.B) { request(b, http.MethodPut, 512*1024*1024, 0, false) }
func BenchmarkHttpsPut4G_0(b *testing.B) { request(b, http.MethodPut, 4*1024*1024*1024, 0, false) }

func BenchmarkHttpsPostForm32_0(b *testing.B) { request(b, http.MethodPost, 32, 0, true) }
func BenchmarkHttpsPostForm256_0(b *testing.B) { request(b, http.MethodPost, 256, 0, true) }
func BenchmarkHttpsPostForm2K_0(b *testing.B) { request(b, http.MethodPost, 2*1024, 0, true) }
func BenchmarkHttpsPostForm16K_0(b *testing.B) { request(b, http.MethodPost, 16*1024, 0, true) }
func BenchmarkHttpsPostForm128K_0(b *testing.B) { request(b, http.MethodPost, 128*1024, 0, true) }
func BenchmarkHttpsPostForm1M_0(b *testing.B) { request(b, http.MethodPost,1024*1024, 0,  true) }
func BenchmarkHttpsPostForm8M_0(b *testing.B) { request(b, http.MethodPost,8*1024*1024, 0,  true) }
func BenchmarkHttpsPostForm64M_0(b *testing.B) { request(b, http.MethodPost, 64*1024*1024, 0, true) }
func BenchmarkHttpsPostForm512M_0(b *testing.B) { request(b, http.MethodPost, 512*1024*1024, 0, true) }
func BenchmarkHttpsPostForm4G_0(b *testing.B) { request(b, http.MethodPost, 4*1024*1024*1024, 0, true) }

func BenchmarkHttpsPutForm32_0(b *testing.B) { request(b, http.MethodPut, 32, 0, true) }
func BenchmarkHttpsPutForm256_0(b *testing.B) { request(b, http.MethodPut, 256, 0, true) }
func BenchmarkHttpsPutForm2K_0(b *testing.B) { request(b, http.MethodPut, 2*1024, 0, true) }
func BenchmarkHttpsPutForm16K_0(b *testing.B) { request(b, http.MethodPut, 16*1024, 0, true) }
func BenchmarkHttpsPutForm128K_0(b *testing.B) { request(b, http.MethodPut, 128*1024, 0, true) }
func BenchmarkHttpsPutForm1M_0(b *testing.B) { request(b, http.MethodPut,1024*1024, 0,  true) }
func BenchmarkHttpsPutForm8M_0(b *testing.B) { request(b, http.MethodPut,8*1024*1024, 0,  true) }
func BenchmarkHttpsPutForm64M_0(b *testing.B) { request(b, http.MethodPut, 64*1024*1024, 0, true) }
func BenchmarkHttpsPutForm512M_0(b *testing.B) { request(b, http.MethodPut, 512*1024*1024, 0, true) }
func BenchmarkHttpsPutForm4G_0(b *testing.B) { request(b, http.MethodPut, 4*1024*1024*1024, 0, true) }

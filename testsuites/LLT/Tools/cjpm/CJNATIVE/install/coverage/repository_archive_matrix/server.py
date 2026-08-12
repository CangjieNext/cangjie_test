# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.

import hashlib
import io
import json
import sys
import tarfile
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import urlparse


LICENSE_CJ = """// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.

"""
LICENSE_TOML = """# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.

"""


def add_bytes(archive, name, data):
    raw = data.encode("utf-8")
    info = tarfile.TarInfo(name)
    info.size = len(raw)
    info.mode = 0o644
    archive.addfile(info, io.BytesIO(raw))


def make_archive(name):
    if name == "invalidpkg":
        return b"not a tar gzip archive"
    top = "goodpkg-1.0.0" if name == "goodpkg" else "unexpected-1.0.0"
    output = io.BytesIO()
    with tarfile.open(fileobj=output, mode="w:gz") as archive:
        toml = LICENSE_TOML + """[package]
cjc-version = "1.0.0"
name = "goodpkg"
version = "1.0.0"
output-type = "executable"
"""
        source = LICENSE_CJ + """package goodpkg

main(): Int64 {
    println("archive-ok")
    return 0
}
"""
        add_bytes(archive, top + "/cjpm.toml", toml)
        add_bytes(archive, top + "/src/main.cj", source)
        if name == "goodpkg":
            add_bytes(archive, "extra.txt", "Copyright (c) Huawei Technologies Co., Ltd. 2026.")
    return output.getvalue()


class Handler(BaseHTTPRequestHandler):
    def log_message(self, _format, *_args):
        return

    def do_GET(self):
        parts = [part for part in urlparse(self.path).path.split("/") if part]
        if not parts:
            self.send_response(404)
            self.end_headers()
            return
        if parts[-1] == "abortpkg":
            self.connection.close()
            return
        if parts[0] == "index":
            name = parts[-1]
            payload = make_archive(name)
            if name == "badindex":
                body = b"not valid index json\n"
                self.send_response(200)
                self.send_header("Content-Length", str(len(body)))
                self.end_headers()
                self.wfile.write(body)
                return
            index = {
                "copyright": "Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.",
                "organization": "",
                "name": name,
                "version": "2.0.0" if name == "noversion" else "1.0.0",
                "dependencies": [],
                "test-dependencies": [],
                "script-dependencies": [],
                "sha256sum": "incorrect-checksum" if name == "hashbad" else hashlib.sha256(payload).hexdigest(),
                "yanked": False,
                "cjc-version": "1.0.0",
                "index-version": 1,
            }
            body = (json.dumps(index) + "\n").encode()
        else:
            name = parts[1]
            body = make_archive(name)
        self.send_response(200)
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)


ThreadingHTTPServer(("127.0.0.1", int(sys.argv[1])), Handler).serve_forever()

#!/bin/bash
sha256sum $1 > checksum.sha256 | sha256sum -c checksum.sha256

#!/bin/bash
sha256sum $1 | grep -q "^$2 "

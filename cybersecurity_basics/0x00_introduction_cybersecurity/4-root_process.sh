#!/bin/bash
ps aux | grep "^$1 " | grep -v " [[:space:]]*0[[:space:]]*0 "

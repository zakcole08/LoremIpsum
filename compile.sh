#!/bin/bash

cc -std=c99 -Wall loremipsum.c mpc/mpc.c -ledit -lm -o loremipsum

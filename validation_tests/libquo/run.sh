#!/bin/bash

. ./setup.sh

CPROG="dist-work.c  quo-time.c rebind.c trivial.c"
FPROG="quofort.f90"

NP=4

for c in $CPROG; do
    n=`echo $c | sed "s/.c$//"`
    echo -n "Running $n ... "
    mpiexec -n $NP ./$n > toto
    RET=$?
    if [ $RET == 0 ] ; then
	echo "[PASS]"
    else
	echo "[FAIL]"
    fi
done

for c in $FPROG; do
    n=`echo $c | sed "s/.f90$//"`
    echo -n "Running $n ... "
    mpiexec -n $NP ./$n > toto
    RET=$?
    if [ $RET == 0 ] ; then
	echo "[PASS]"
    else
	echo "[FAIL]"
    fi
done

rm toto

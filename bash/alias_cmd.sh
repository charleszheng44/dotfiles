#!/usr/bin/env bash

function ff() {
    find . -type f -name $1
}

function fd() {
    find . -type d -name $1
}

function kc() {
    case "$1" in  
        "del")
            shift
            kubectl delete $@
            ;;
        "ap")
            shift
            kubectl apply $@
            ;;
        "g")
            shift
            kubectl get $@
            ;;
        "des")
            shift
            kubectl describe $@
            ;;
        *)
            kubectl $@
            ;;
    esac
}

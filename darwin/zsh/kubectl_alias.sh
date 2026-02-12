#!/usr/bin/env zsh

kc() {
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

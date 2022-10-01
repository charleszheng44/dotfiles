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
        "ci" )
            shift
            kubectl cluster-info $@
        *)
            kubectl $@
            ;;
    esac
}

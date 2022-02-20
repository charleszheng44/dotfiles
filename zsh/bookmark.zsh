#!/usr/bin/env zsh

bookmarkfile=$(realpath ~/.bookmarks)

# list all bookmark
list_bookmarks() {
    if [ ! -f $bookmarkfile ];
    then
        echo "bookmarks empty"
        return 1
    fi
    cat $bookmarkfile
}

# add current dir to bookmarks
add_bookmark() {
    if [ -z "$1" ];
    then
        echo "please specify a bookmark name"
        return 1
    fi
    bookmark=$1
    current_dir=$PWD
    # create bookmark file if not exist
    if [ ! -f $bookmarkfile ];
    then
        touch $bookmarkfile
    fi
    
    while read -r line;
    do
        read -r bm bm_path <<< "$line"
        # if the bookmark exists, update it
        if [[ "$bm" == "$bookmark" ]] 
        then
            sed -i "s|$bm_path|$current_dir|g" $bookmarkfile
            return
        fi
    done < "$bookmarkfile"
    # else, generate a new entry 
    echo "$bookmark $current_dir" >> $bookmarkfile
}

# go to bookmark
goto_bookmark() {
    if [ -z "$1" ];
    then
        echo "please specify a bookmark name"
        return 1
    fi
    target_bookmark=$1
    if [ ! -f $bookmarkfile ];
    then
        echo "${target_bookmark} not found"
        return 1
    fi
    while read -r line; 
    do
        tmp_bookmark=$(echo $line | cut -d' ' -f1)
        tmp_path=$(echo $line | cut -d' ' -f2)
        if [[ "${tmp_bookmark}" == "${target_bookmark}" ]]; 
        then
            cd ${tmp_path}
            return
        fi
    done < $bookmarkfile

    echo "${target_bookmark} not found"
    return 1
}

# delete book bookmark
delete_bookmark() {
    if [ -z "$1" ];
    then
        echo "please specify a bookmark name"
        return 1
    fi
    target_bookmark=$1
    if [ ! -f $bookmarkfile ];
    then
        echo "${target_bookmark} not found"
        return 1
    fi
    while read -r line; 
    do 
        [[ ! $line =~ ${target_bookmark} ]] && echo "$line"
    done < $bookmarkfile > tmp_file
    mv tmp_file $bookmarkfile 
    echo "${target_bookmark} has been deleted"
}

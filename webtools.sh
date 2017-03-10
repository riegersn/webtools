#!/bin/bash
#
# webtools.sh
# bower is bloat for me
#
# Copyright (C) 2017 Shawn Rieger - All Rights Reserved
# Permission to copy and modify is granted under the MIT license
# Last revised 3/9/2017, 9:23:56 PM

# Loading config
source webtools_conf.sh;

# Create dirs
mkdir -p $project/$js_dir $project/$css_dir $project/$font_dir

# Mode
# Will copy by default, pass --link to ln the files instead
mode="cp -a"
if [ -n "$1" ] && [ "$1" == "--link" ]; then
  mode="ln -sf"
fi

# Loop through the file list
for i in "${filelist[@]}"
do
  :
  last=`echo "${i: -1}"`
  if [ "$last" == "*" ]; then
    $mode $project/$components/$i $project/$font_dir
    printf "$i -> $font_dir\n"

  elif [ -f "$project/$components/$i"  ]; then
    file="$(basename $i)"
    ext="${file##*.}"
    case "$ext" in
      'js' )
        fldr=$js_dir
        $mode $project/$components/$i $project/$fldr
        printf "$i -> $fldr\n"
        ;;
      'css' )
        fldr=$css_dir
        $mode $project/$components/$i $project/$fldr
        printf "$i -> $fldr\n"
        ;;
      * )
        printf "$i (unknown)\n"
        ;;
    esac

  else
    printf "$i (error)\n"
  fi
done

#! /bin/sh

dirs=`ls chapters`
#echo $dirs

max() {
        #echo `pwd`
	maxnum=0;
  	#ls -1 *.html| grep -o '[[:digit:]][[:digit:]]\?.html'|sed 's/.html//'|sort|while read n
  	#ls -1 *.html| grep -o '[[:digit:]][[:digit:]]\?.html'|sed 's/.html//'|while read n

        for f in `ls *.html`
	do
	        n=`echo $f |grep -o '[[:digit:]][[:digit:]]\?.html'|sed 's/.html//'`
		#n=`echo $n|sed 's/^[[:blank:]]*//' | sed 's/[[:blank:]]*$//'`
		
		if [ -z "$n" ]
		then
			continue;
		fi

		#echo "This is:"$n
		if [ "$maxnum" -lt "$n" ]
		then
			maxnum=$n
		fi
	done


	return $maxnum;
}

v=1
while [ "$v" -lt "12" ]
do
	echo "-----------------------:" $v
	echo "<hr>"
	echo "<h3>Chatper $v</h3>"
	echo "<table>"
	echo "<tbody>"

        dir="chapters/ch"$v
       
        #echo $dir
        cd $dir
       
        files=`ls *.html`
        #echo $files
    
        max;
        #echo "Max is:"$maxnum

	j=1
	while [ "$j" -lt "$maxnum" ]
	do
	    file="Ch$v""Ex$j"
	    #echo $file

            echo "<tr>"
	    echo "<td>$j</td><td></td>"
	    htmltag='<td><a href="chapters/ch'$v'/'$file'.html">'$file'</a></br></td>'
	    echo $htmltag
	    echo "</tr>"

	    j=`expr $j + 1`
	done
	echo "</tbody>"
	echo "</table>"

        #for file in $files
	#do
	#	echo $file
	#done

        cd ../../
	v=`expr $v + 1`
done

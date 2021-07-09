for i in `ls *_1.fastq`;
do
    second=`echo ${i} | sed 's/_1/_2/g'`
    o1=`echo ${i} | sed 's/_1/QCP_1/g'`
    o2=`echo ${second} | sed 's/_2/QCP_2/g'`
    report=`echo ${i} | sed 's/_1.fastq/fastpReport/g'`
    # Do what ever with first fastq be ${i} and second be ${second}
    fastp -i ${i} -I ${second} -o ${o1} -O ${o2} --qualified_quality_phred 20 --length_required 80 --thread 7 --json ${report}.json --html ${report}.html
done





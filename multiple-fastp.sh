#A tiny bash script to help you run fastp for multiple files. 
#My folder had multiple paired end raw illumina .fastq files. 
#The follwing files can can be changed according to your needs. 
    #--qualified_quality_phred 20
    #--length_required 80
    #--thread 7 (yes, I'm poor.)

for i in `ls *_1.fastq`; #might be _.1fastq.gz for you
do
    second=`echo ${i} | sed 's/_1/_2/g'`
    o1=`echo ${i} | sed 's/_1/QCP_1/g'`
    o2=`echo ${second} | sed 's/_2/QCP_2/g'`
    report=`echo ${i} | sed 's/_1.fastq/fastpReport/g'`
    fastp -i ${i} -I ${second} -o ${o1} -O ${o2} --qualified_quality_phred 20 --length_required 80 --thread 7 --json ${report}.json --html ${report}.html
done

#I got the basic code from https://www.biostars.org/p/487295/#487296 and then added modifications. 

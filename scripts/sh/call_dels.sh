#!/bin/bash
for i in 'seq 1 15';do
	echo $i:
	echo
	cat ~/svc/results/s2.srr505.${i}.nord/deletions.bedpe | cut -f1,2,6 | awk '$3 > $2 && $2 >0' > dels 
	bedtools intersect -wa -wb -f $1 -r -a dels -b ALL_DELS.gt100bp.merged.d0.uniq.bed | cut -f4-6 | sort | uniq | wc -l
	bedtools intersect -wa -wb -f $1 -r -a dels -b ALL_DELS.gt100bp.merged.d0.uniq.bed | sort | uniq | cut -f1-3 | sort | uniq -d| wc -l
	echo
done

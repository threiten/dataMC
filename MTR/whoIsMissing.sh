#!/bin/bash

k=0.1

ls weights_MaxDepth_10_minLeaf_50  > weights_MaxDepth_10_minLeaf_50.txt
ls weights_MaxDepth_10_minLeaf_9   > weights_MaxDepth_10_minLeaf_9.txt
ls weights_MaxDepth_3_minLeaf_50   > weights_MaxDepth_3_minLeaf_50.txt
ls weights_MaxDepth_3_minLeaf_9    > weights_MaxDepth_3_minLeaf_9.txt

for var in  "R9" "S4" "SigmaIeIe" "EtaWidth" "PhiWidth" "CovarianceIphiIphi" "SigmaRR";
do
    for i in `seq 1 9`;
    do
	q=`echo "$k*$i"|bc`
	for file in "weights_MaxDepth_10_minLeaf_50.txt" "weights_MaxDepth_10_minLeaf_9.txt" "weights_MaxDepth_3_minLeaf_50.txt" "weights_MaxDepth_3_minLeaf_9.txt";
	do
	    namemc=mc_weights_$var\_0$q.pkl
	    if ! grep -q $namemc $file;
	    then 
		echo weights_MaxDepth_3_minLeaf_50/$namemc does not exist
	    fi
	    namedata=data_weights_$var\_0$q.pkl
	    if ! grep -q $namedata $file;
	    then 
		echo weights_MaxDepth_3_minLeaf_50/$namedata does not exist
	    fi
	done


#	mc_weights_CovarianceIphiIphi_0.8.pkl
#	
#	qsub jobba.sh "mc" $var $q 0 1500000 3 9 -q short.q
#	qsub jobba.sh "data" $var $q 0 -1 3 9 -q short.q 
#
#	qsub jobba.sh "mc" $var $q 0 1500000 10 9 -q short.q
#	qsub jobba.sh "data" $var $q 0 -1 10 9 -q short.q 
#
#	qsub jobba.sh "mc" $var $q 0 1500000 3 50 -q short.q
#	qsub jobba.sh "data" $var $q 0 -1 3 50 -q short.q 
#
#	qsub jobba.sh "mc" $var $q 0 1500000 10 50 -q short.q
#	qsub jobba.sh "data" $var $q 0 -1 10 50 -q short.q 
	
	done
done
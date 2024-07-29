-- Load input file from HDFS
inputFile1 = LOAD 'hdfs:///user/smitha/inputs/episode1_dialogues.txt' USING PigStorage('\t') AS (name:chararray,line:chararray);
inputFile2 = LOAD 'hdfs:///user/smitha/inputs/episode2_dialogues.txt' USING PigStorage('\t') AS (name:chararray,line:chararray);
inputFile3 = LOAD 'hdfs:///user/smitha/inputs/episode3_dialogues.txt' USING PigStorage('\t') AS (name:chararray,line:chararray);

randked1 = RANK  inputFile1;
onlydialog1 = FILTER ranked1 BY(rank_inputFile1>2);  
randked2 = RANK  inputFile2;
onlydialog2 = FILTER ranked2 BY(rank_inputFile2>2);  
randked3 = RANK  inputFile3;
onlydialog3 = FILTER ranked3 BY(rank_inputFile3>2);  

inputData = UNION onlydialog1,onlydialog2,onlydialog3;

groupByName = GROUP inputData BY name;

names = FOREACH groupByName generate $0 AS name, COUNT($1) as numberOfLines;

ordered = ORDER names BY numberOfLines DESC;

STORE ordered INTO 'hdfs:///user/smitha/output' USING PigStorage('\t');
hadoop jar $OSCH_HOME/jlib/orahdfs.jar \
       oracle.hadoop.exttab.ExternalTable \
       -conf /home/oracle/movie/moviework/osch/moviefact_publish.xml \
       -publish

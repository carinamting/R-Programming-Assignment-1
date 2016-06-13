corr<-function(directory,threshold=0){
        ## directory - character string directory name
        ## threshold is number of complete observations necessary to use data froom monitor
        ## corr - vector of correlations
        corr_vector<-numeric()
        allids=1:332
        mycount<-0
        for (myid in allids){
                myfile<-getmydatafile(directory,myid)
                mydata<-read.csv(myfile)
                allnitrate<-mydata[,"nitrate"]
                allsulfate<-mydata[,"sulfate"]
                mycomplete<-!is.na(allnitrate) & !is.na(allsulfate)
                ncomplete<-length(mycomplete[mycomplete==TRUE])
                if(ncomplete>threshold){
                        mycount<-mycount+1
                        ##id[mycount]<-myid 
                        nitrate<-allnitrate[mycomplete==TRUE]
                        sulfate<-allsulfate[mycomplete==TRUE]
                        corr_vector[mycount]<-cor(nitrate,sulfate)
                }

        }
        corr_vector
} 
complete<-function(directory,id=1:332){
        ## directory - string reps directory containing files
        ## id is integer vector of monitor ids of files
        ## complete is data frame: id, nobs(number of complete daily observations)
        nobs<-numeric(length(id))
        mycount<-0
        for (myid in id){
                myfile<-getmydatafile(directory,myid)
                mycount<-mycount+1
                mydata<-read.csv(myfile)
                mycomplete<-!is.na(mydata[,"nitrate"]) & !is.na(mydata[,"sulfate"])
                nobs[mycount]<-length(mycomplete[mycomplete==TRUE])
        }
        data.frame(id=id,nobs=nobs)
}
getmydatafile<-function(directory,myid){
        idstr<-as.character(myid)
        if(myid<10){
                myname<-paste("00",idstr,sep="")
        }else if(myid<100){
                myname<-paste("0",idstr,sep="")
        }else{
                myname<-idstr
        }
       paste(directory,"/",myname,".csv",sep="")
        
}
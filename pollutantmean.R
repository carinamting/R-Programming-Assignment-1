pollutantmean<-function(directory,pollutant,id=1:332){
        ## directory - character string
        ## pollutant - character string "nitrate" or "sulfate"
        ## id - integer vector for each monitor id for file name within directory <1000
        ## pollutantmean is mean of all complete observations over monitor ids
        allvals=numeric()
        istart<-1
        for (myid in id){

                idstr<-as.character(myid)
                if(myid<10){
                        myname<-paste("00",idstr,sep="")
                }else if(myid<100){

                        myname<-paste("0",idstr,sep="")
                }else{
                        myname<-idstr
                }
                myfile<-paste(directory,"/",myname,".csv",sep="")
                mydata<-read.csv(myfile)
                temp<-mydata[,pollutant]
                iend<-istart-1+length(temp)
                allvals[istart:iend]<-temp
                istart<-iend+1
                }
        mean(allvals,na.rm=TRUE)
}

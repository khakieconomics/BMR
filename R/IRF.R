IRF.BVARM <- function(obj,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  .irfbvarm(obj,percentiles,save,height,width)
}

IRF.BVARS <- function(obj,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  .irfbvars(obj,percentiles,save,height,width)
}

IRF.BVARW <- function(obj,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  .irfbvarw(obj,percentiles,save,height,width)
}

IRF.CVAR <- function(obj,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  .irfcvar(obj,percentiles,save,height,width)
}

IRF.BVARTVP <- function(obj,whichirfs=NULL,percentiles=c(.05,.50,.95),save=FALSE,height=13,width=13){
  .irfbvartvp(obj,whichirfs,percentiles,save,height,width)
}

.irfbvarm <- function(obj,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  irf.periods <- dim(obj$IRFs)[1]
  M <- dim(obj$IRFs)[4]
  mydata <- obj$data
  IRFs <- obj$IRFs
  #
  if(class(dev.list()) != "NULL"){dev.off()}
  #
  vplayout <- function(x,y){viewport(layout.pos.row=x, layout.pos.col=y)}
  #
  total <- dim(IRFs)[3]
  IRFUpper <- round(percentiles[3]*total)
  IRFMid <- round(percentiles[2]*total)
  IRFLower <- round(percentiles[1]*total)
  #
  IRFPlot <- array(NA,dim=c(irf.periods,4,M,M))
  for(i in 1:M){
    for(k in 1:M){
      IRFPData <- data.frame(IRFs[,k,IRFLower,i],IRFs[,k,IRFMid,i],IRFs[,k,IRFUpper,i],1:(irf.periods))
      IRFPData <- as.matrix(IRFPData)
      IRFPlot[,,k,i] <- IRFPData
    }
  }
  if(class(dev.list()) != "NULL"){dev.off()}
  if(save==TRUE){cairo_ps(file="IRFs.eps",height=height,width=width)}
  pushViewport(viewport(layout=grid.layout(M,M)))
  #
  for(i in 1:M){
    for(k in 1:M){
      NameImpulse <- colnames(mydata)[k]
      NameRespone <- colnames(mydata)[i]
      #
      IRFDF <- IRFPlot[,,k,i]
      IRFDF <- data.frame(IRFDF)
      colnames(IRFDF) <- c("IRFL","IRFM","IRFU","Time")
      #
      print(ggplot(data=(IRFDF),aes(x=Time)) + xlab("Horizon") + ylab(paste("Shock from ",NameRespone," to", NameImpulse)) + geom_ribbon(aes(ymin=IRFL,ymax=IRFU),color="blue",lty=1,fill="blue",alpha=0.2,size=0.1) + geom_hline(yintercept=0) + geom_line(aes(y=IRFM),color="red",size=2),vp = vplayout(i,k))
      #
      Sys.sleep(0.6)
    }
  }
  if(save==TRUE){dev.off()}
  #
  return=list(IRFs=IRFPlot)
}

.irfbvars <- function(obj,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  irf.periods <- dim(obj$IRFs)[1]
  M <- dim(obj$IRFs)[4]
  mydata <- obj$data
  IRFs <- obj$IRFs
  #
  if(class(dev.list()) != "NULL"){dev.off()}
  #
  vplayout <- function(x,y){viewport(layout.pos.row=x, layout.pos.col=y)}
  #
  total <- dim(IRFs)[3]
  IRFUpper <- round(percentiles[3]*total)
  IRFMid <- round(percentiles[2]*total)
  IRFLower <- round(percentiles[1]*total)
  #
  IRFPlot <- array(NA,dim=c(irf.periods,4,M,M))
  for(i in 1:M){
    for(k in 1:M){
      IRFPData <- data.frame(IRFs[,k,IRFLower,i],IRFs[,k,IRFMid,i],IRFs[,k,IRFUpper,i],1:(irf.periods))
      IRFPData <- as.matrix(IRFPData)
      IRFPlot[,,k,i] <- IRFPData
    }
  }
  if(class(dev.list()) != "NULL"){dev.off()}
  if(save==TRUE){cairo_ps(file="IRFs.eps",height=height,width=width)}
  pushViewport(viewport(layout=grid.layout(M,M)))
  #
  for(i in 1:M){
    for(k in 1:M){
      NameImpulse <- colnames(mydata)[k]
      NameRespone <- colnames(mydata)[i]
      #
      IRFDF <- IRFPlot[,,k,i]
      IRFDF <- data.frame(IRFDF)
      colnames(IRFDF) <- c("IRFL","IRFM","IRFU","Time")
      #
      print(ggplot(data=(IRFDF),aes(x=Time)) + xlab("Horizon") + ylab(paste("Shock from ",NameRespone," to", NameImpulse)) + geom_ribbon(aes(ymin=IRFL,ymax=IRFU),color="blue",lty=1,fill="blue",alpha=0.2,size=0.1) + geom_hline(yintercept=0) + geom_line(aes(y=IRFM),color="red",size=2),vp = vplayout(i,k))
      #
      Sys.sleep(0.6)
    }
  }
  if(save==TRUE){dev.off()}
  #
  return=list(IRFs=IRFPlot)
}

.irfbvarw <- function(obj,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  irf.periods <- dim(obj$IRFs)[1]
  M <- dim(obj$IRFs)[4]
  mydata <- obj$data
  IRFs <- obj$IRFs
  #
  if(class(dev.list()) != "NULL"){dev.off()}
  #
  vplayout <- function(x,y){viewport(layout.pos.row=x, layout.pos.col=y)}
  #
  total <- dim(IRFs)[3]
  IRFUpper <- round(percentiles[3]*total)
  IRFMid <- round(percentiles[2]*total)
  IRFLower <- round(percentiles[1]*total)
  #
  IRFPlot <- array(NA,dim=c(irf.periods,4,M,M))
  for(i in 1:M){
    for(k in 1:M){
      IRFPData <- data.frame(IRFs[,k,IRFLower,i],IRFs[,k,IRFMid,i],IRFs[,k,IRFUpper,i],1:(irf.periods))
      IRFPData <- as.matrix(IRFPData)
      IRFPlot[,,k,i] <- IRFPData
    }
  }
  if(class(dev.list()) != "NULL"){dev.off()}
  if(save==TRUE){cairo_ps(file="IRFs.eps",height=height,width=width)}
  pushViewport(viewport(layout=grid.layout(M,M)))
  #
  for(i in 1:M){
    for(k in 1:M){
      NameImpulse <- colnames(mydata)[k]
      NameRespone <- colnames(mydata)[i]
      #
      IRFDF <- IRFPlot[,,k,i]
      IRFDF <- data.frame(IRFDF)
      colnames(IRFDF) <- c("IRFL","IRFM","IRFU","Time")
      #
      print(ggplot(data=(IRFDF),aes(x=Time)) + xlab("Horizon") + ylab(paste("Shock from ",NameRespone," to", NameImpulse)) + geom_ribbon(aes(ymin=IRFL,ymax=IRFU),color="blue",lty=1,fill="blue",alpha=0.2,size=0.1) + geom_hline(yintercept=0) + geom_line(aes(y=IRFM),color="red",size=2),vp = vplayout(i,k))
      #
      Sys.sleep(0.6)
    }
  }
  if(save==TRUE){dev.off()}
  #
  return=list(IRFs=IRFPlot)
}

.irfcvar <- function(obj,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  irf.periods <- dim(obj$IRFs)[1]
  M <- dim(obj$IRFs)[4]
  mydata <- obj$data
  IRFs <- obj$IRFs
  #
  if(class(dev.list()) != "NULL"){dev.off()}
  #
  vplayout <- function(x,y){viewport(layout.pos.row=x, layout.pos.col=y)}
  #
  total <- dim(IRFs)[3]
  IRFUpper <- round(percentiles[3]*total)
  IRFMid <- round(percentiles[2]*total)
  IRFLower <- round(percentiles[1]*total)
  #
  IRFPlot <- array(NA,dim=c(irf.periods,4,M,M))
  for(i in 1:M){
    for(k in 1:M){
      IRFPData <- data.frame(IRFs[,k,IRFLower,i],IRFs[,k,IRFMid,i],IRFs[,k,IRFUpper,i],1:(irf.periods))
      IRFPData <- as.matrix(IRFPData)
      IRFPlot[,,k,i] <- IRFPData
    }
  }
  if(class(dev.list()) != "NULL"){dev.off()}
  if(save==TRUE){cairo_ps(file="IRFs.eps",height=height,width=width)}
  pushViewport(viewport(layout=grid.layout(M,M)))
  #
  for(i in 1:M){
    for(k in 1:M){
      NameImpulse <- colnames(mydata)[k]
      NameRespone <- colnames(mydata)[i]
      #
      IRFDF <- IRFPlot[,,k,i]
      IRFDF <- data.frame(IRFDF)
      colnames(IRFDF) <- c("IRFL","IRFM","IRFU","Time")
      #
      print(ggplot(data=(IRFDF),aes(x=Time)) + xlab("Horizon") + ylab(paste("Shock from ",NameRespone," to", NameImpulse)) + geom_ribbon(aes(ymin=IRFL,ymax=IRFU),color="blue",lty=1,fill="blue",alpha=0.2,size=0.1) + geom_hline(yintercept=0) + geom_line(aes(y=IRFM),color="red",size=2),vp = vplayout(i,k))
      #
      Sys.sleep(0.6)
    }
  }
  if(save==TRUE){dev.off()}
  #
  return=list(IRFs=IRFPlot)
}

.irfbvartvp <- function(obj,whichirfs=NULL,percentiles=c(.05,.50,.95),save=FALSE,height=13,width=13){
  IRFs <- obj$IRFs
  irf.periods <- as.numeric(dim(IRFs)[1])
  M <- as.numeric(dim(IRFs)[3])
  irf.points <- obj$irf.points
  mydata <- obj$data
  tau <- obj$tau
  #
  if(class(dev.list()) != "NULL"){dev.off()}
  #
  vplayout<-function(x,y){viewport(layout.pos.row=x, layout.pos.col=y)}
  #
  total <- as.numeric(dim(IRFs)[5])
  IRFUpper <- round(percentiles[3]*total)
  IRFMid <- round(percentiles[2]*total)
  IRFLower <- round(percentiles[1]*total)
  #
  if(class(whichirfs)!="NULL"){
    imp.pl <- as.numeric(length(whichirfs))
    whichirfs <- whichirfs - tau
  }else{
    imp.pl <- 1:as.numeric(dim(IRFs)[4])
    whichirfs <- imp.pl
  }
  #
  IRFPlot<-array(NA,dim=c(irf.periods,4,M,M,as.numeric(dim(IRFs)[4])))
  for(ik in imp.pl){
    iki <- whichirfs[ik]
    for(i in 1:M){ #shock number
      for(k in 1:M){ #variable number
        IRFPData<-data.frame(IRFs[,k,i,iki,IRFLower],IRFs[,k,i,iki,IRFMid],IRFs[,k,i,iki,IRFUpper],1:(irf.periods))
        IRFPData<-as.matrix(IRFPData)
        IRFPlot[,,k,i,ik]<-IRFPData
      }
    }
  }
  #
  for(ik in 1:as.numeric(dim(IRFs)[4])){
    SaveName <- paste(as.character(irf.points[ik]),".eps",sep="")
    if(save==TRUE){cairo_ps(file=SaveName,height=height,width=width)}
    #
    grid.newpage()
    pushViewport(viewport(layout=grid.layout(M,M)))
    #
    for(i in 1:M){
      for(k in 1:M){
        NameImpulse <- colnames(mydata)[k]
        NameRespone <- colnames(mydata)[i]
        #
        IRFDF <- IRFPlot[,,k,i,ik]
        IRFDF <- data.frame(IRFDF)
        colnames(IRFDF) <- c("IRFL","IRFM","IRFU","Time")
        #
        print(ggplot(data=(IRFDF),aes(x=Time)) + xlab("Horizon") + ylab(paste("Shock from ",NameRespone," to", NameImpulse)) + geom_ribbon(aes(ymin=IRFL,ymax=IRFU),color="blue",lty=1,fill="blue",alpha=0.2,size=0.1) + geom_hline(yintercept=0) + geom_line(aes(y=IRFM),color="red",size=2),vp = vplayout(i,k))
        #
        Sys.sleep(0.6)
      }
    }
    if(save==TRUE){dev.off()}
  }
  #
  SaveCompName <- "IRFComparison.eps"
  if(save==TRUE){cairo_ps(file=SaveCompName,height=height,width=width)}
  grid.newpage()
  pushViewport(viewport(layout=grid.layout(M,M)))
  for(i in 1:M){
    for(k in 1:M){
      NameImpulse <- colnames(mydata)[k]
      NameRespone <- colnames(mydata)[i]
      #
      IRFDF <-data.frame(IRFPlot[,2,k,i,],1:irf.periods)
      nnames <- c(as.character(irf.points),"irf.periods")
      colnames(IRFDF) <- nnames
      #
      colIRFDF<-as.numeric(ncol(IRFDF))
      rowIRFDF<-as.numeric(nrow(IRFDF))
      newIRFDF <- matrix(NA,nrow=(nrow(IRFDF)*(ncol(IRFDF)-1)),ncol=3)
      newIRFDF <- data.frame(newIRFDF)
      for(j in 1:(ncol(IRFDF)-1)){
        newIRFDF[(((j-1)*rowIRFDF)+1):(j*rowIRFDF),1] <- 1:irf.periods
        newIRFDF[(((j-1)*rowIRFDF)+1):(j*rowIRFDF),2] <- rep(colnames(IRFDF)[j],rowIRFDF)
      }
      #
      newIRFDF[,3] <- c(IRFPlot[,2,k,i,])
      #
      IRFDF <- newIRFDF
      colnames(IRFDF) <- c("irf.periods","variable","value")
      #
      if(i == 1 & k == 1){
        print(ggplot(data=IRFDF,aes(x=irf.periods,y=value,colour=variable)) + geom_line() + xlab("Horizon") + ylab(paste("Shock from ",NameRespone," to", NameImpulse)) + geom_hline(yintercept=0) + scale_colour_hue("") + theme(legend.position="top",legend.direction="horizontal", legend.background=element_blank()),vp = vplayout(i,k))
      }else{
        print(ggplot(data=IRFDF,aes(x=irf.periods,y=value,colour=variable)) + geom_line() + xlab("Horizon") + ylab(paste("Shock from ",NameRespone," to", NameImpulse)) + geom_hline(yintercept=0) + theme(legend.position="none"),vp = vplayout(i,k))
      }
      #
      Sys.sleep(0.6)
    }
  }
  if(save==TRUE){dev.off()}
  #
}

IRF.SDSGE <- function(obj,shocks,irf.periods=20,varnames=NULL,plot=TRUE,save=FALSE,height=13,width=13){
  .irfsdsge(obj,shocks,irf.periods,varnames,plot,save,height,width)
}

IRF.EDSGE <- function(obj,ObservableIRFs=TRUE,varnames=NULL,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  .irfedsge(obj,ObservableIRFs,varnames,percentiles,save,height,width)
}

IRF.DSGEVAR <- function(obj,varnames=NULL,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  .irfdsgevar(obj,varnames,percentiles,save,height,width)
}

.irfsdsge <- function(obj,shocks,irf.periods=20,varnames=NULL,plot=TRUE,save=FALSE,height=13,width=13){
  #
  StateMats <- .DSGEstatespace(obj$N,obj$P,obj$Q,obj$R,obj$S)
  F <- StateMats$F; G <- StateMats$G
  nShocks <- as.numeric(ncol(obj$N))
  #
  IRFs <- array(0,dim=c(irf.periods,ncol(F),nShocks))
  #
  for(j in 1:nShocks){
    shockvec <- matrix(rep(0,nrow(G) - (nrow(obj$N) - j + 1)),ncol=1)
    shockvec <- rbind( shockvec,shocks[j],matrix(rep(0,nrow(obj$N)-j),ncol=1) )
    #shockvec <- rbind(shockvec,shocks[j],c(rep(0,nrow(obj$N)-j)))
    # Resp = F*G*1, or Resp' = 1'G'F'
    IRFs[1,,j] <- t(G%*%shockvec)
    for(i in 2:irf.periods){
      IRFs[i,,j] <- IRFs[i-1,,j]%*%t(F)
    }
  }
  IRFsRet <- IRFs
  #
  nResp <- as.numeric(ncol(IRFs))
  if(class(varnames) != "character"){
    varnames <- character(length=nResp)
    for(i in 1:nResp){  
      varnames[i] <- paste("VAR",i,sep="")
    }
  }
  #
  colnames(IRFsRet) <- varnames
  #
  if(nShocks > 1){
    IRFs <- array(0,dim=c(irf.periods,ncol(F)-nShocks+1,nShocks))
    DropCount <- (ncol(F)-nShocks+1):ncol(F)
    for(j in 1:nShocks){
      IRFs[,,j] <- IRFsRet[,-DropCount[-(j)],j]
    }
  }
  #
  # Plot
  #
  nRespPlot <- nResp - nShocks + 1
  MR <- 0; MC <- 0
  if(plot==TRUE){
    if(nRespPlot < 4){
      MR <- nRespPlot; MC <- 1
    }else if(nRespPlot == 4){
      MR <- 2; MC <-2
    }else if(nRespPlot > 4 && nRespPlot < 7){
      MR <- 3; MC <- 2
    }else if(nRespPlot > 6 && nRespPlot < 10){
      MR <- 3; MC <- 3
    }else if(nRespPlot > 9 && nRespPlot < 13){
      MR <- 4; MC <- 3
    }else if(nRespPlot > 12 && nRespPlot < 17){
      MR <- 4; MC <- 4
    }else if(nRespPlot > 17 && nRespPlot < 21){
      MR <- 5; MC <- 4
    }else if(nRespPlot > 20 && nRespPlot < 26){
      MR <- 5; MC <- 5
    }else if(nRespPlot > 25 && nRespPlot < 31){
      MR <- 5; MC <- 6
    }else if(nRespPlot > 30 && nRespPlot < 37){
      MR <- 6; MC <- 6
    }else{
      stop("You have too many IRFs to plot!")
    }
    #
    if(class(dev.list()) != "NULL"){dev.off()}
    #
    vplayout <- function(x,y){viewport(layout.pos.row=x, layout.pos.col=y)}
    #
    for(j in 1:nShocks){
      #
      if(save==TRUE){
        if(nShocks==1){
          cairo_ps(file="DSGEIRFs.eps",height=height,width=width)
        }else{
          SaveIRF <- paste(varnames[nResp-nShocks+j],"_Shock",".eps",sep="")
          #
          if(save==TRUE){cairo_ps(file=SaveIRF,height=height,width=width)}
        }
      }
      grid.newpage()
      pushViewport(viewport(layout=grid.layout(MR,MC)))
      #
      if(nShocks > 1){
        varnames2 <- varnames[-DropCount[-(j)]]
      }else{varnames2 <- varnames}
      #
      IRFCount <- 1
      for(i in 1:MR){
        for(k in 1:MC){
          #
          if(IRFCount <= (nResp - nShocks + 1)){
            IRFDF <- data.frame(IRFs[,IRFCount,j],1:(irf.periods))
            colnames(IRFDF) <- c("IRFM","Time")
            #
            print(ggplot(data=(IRFDF),aes(x=Time)) + xlab("Horizon") + ylab(paste(varnames2[IRFCount])) + geom_hline(yintercept=0) + geom_line(aes(y=IRFM),color="purple",size=2),vp = vplayout(i,k))
            #
            IRFCount <- IRFCount + 1
            #
            Sys.sleep(0.6)
          }else{IRFCount <- IRFCount + 1}
        }
      }
      if(save==TRUE){dev.off()}
    }
  }
  #
  #colnames(IRFs) <- varnames
  #
  return=list(IRFs=IRFsRet)
}

.irfedsge <- function(obj,ObservableIRFs=TRUE,varnames=NULL,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  #
  if(nrow(obj$Parameters)==0){
    stop("no MCMC draws detected.\n",call.=FALSE)
  }
  #
  IRFs <- round(obj$IRFs,10)
  irf.periods <- as.numeric(dim(IRFs)[1])
  nResp <- as.numeric(dim(IRFs)[2])
  nShocks <- as.numeric(dim(IRFs)[3])
  keep <- dim(IRFs)[4]
  #
  ObserveMat <- obj$ObserveMat
  #
  IRFObservable <- array(0,dim=c(irf.periods,ncol(ObserveMat),nShocks,keep))
  if(ObservableIRFs == TRUE){
    if(ncol(ObserveMat)==1){
      for(i in 1:keep){
        for(j in 1:nShocks){
          IRFObservable[,1,j,i] <- IRFs[,,j,i]%*%ObserveMat
        }
      }
    }else{
      for(i in 1:keep){
        for(j in 1:nShocks){
          IRFObservable[,,j,i] <- IRFs[,,j,i]%*%ObserveMat
        }
      }
    }
    IRFs <- IRFObservable
    nResp <- as.numeric(ncol(ObserveMat))
  }
  #
  ImpSorted<-aperm(IRFs,c(2,3,1,4))
  #
  IRFs<-apply(ImpSorted,c(3,1,2),sort)
  #
  IRFUpper <- round(percentiles[3]*keep)
  IRFMid <- round(percentiles[2]*keep)
  IRFLower <- round(percentiles[1]*keep)
  #
  IRFPlot <- array(NA,dim=c(irf.periods,4,nResp,nShocks))
  for(i in 1:nShocks){
    for(k in 1:nResp){
      IRFPData <- data.frame(c(IRFs[IRFLower,,k,i]),c(IRFs[IRFMid,,k,i]),c(IRFs[IRFUpper,,k,i]),1:(irf.periods))
      IRFPData <- as.matrix(IRFPData)
      IRFPlot[,,k,i] <- IRFPData
    }
  }
  #
  IRFsRet <- IRFPlot
  #
  if(class(varnames) != "character"){
    varnames <- character(length=nResp)
    for(i in 1:nResp){  
      varnames[i] <- paste("VAR",i,sep="")
    }
  }
  #
  if(nShocks > 1 && ObservableIRFs!=TRUE){
    IRFPlot <- array(0,dim=c(irf.periods,4,nResp-nShocks+1,nShocks))
    DropCount <- (nResp-nShocks+1):nResp
    for(j in 1:nShocks){
      IRFPlot[,,,j] <- IRFsRet[,,-DropCount[-(j)],j]
    }
  }
  #
  nRespPlot <- nResp - nShocks + 1
  MR <- 0; MC <- 0
  if(nRespPlot < 4){
    MR <- nRespPlot; MC <- 1
  }else if(nRespPlot == 4){
    MR <- 2; MC <-2
  }else if(nRespPlot > 4 && nRespPlot < 7){
    MR <- 3; MC <- 2
  }else if(nRespPlot > 6 && nRespPlot < 10){
    MR <- 3; MC <- 3
  }else if(nRespPlot > 9 && nRespPlot < 13){
    MR <- 4; MC <- 3
  }else if(nRespPlot > 12 && nRespPlot < 17){
    MR <- 4; MC <- 4
  }else if(nRespPlot > 17 && nRespPlot < 21){
    MR <- 5; MC <- 4
  }else if(nRespPlot > 20 && nRespPlot < 26){
    MR <- 5; MC <- 5
  }else if(nRespPlot > 25 && nRespPlot < 31){
    MR <- 5; MC <- 6
  }else if(nRespPlot > 30 && nRespPlot < 37){
    MR <- 6; MC <- 6
  }else{
    stop("You have too many IRFs to plot!")
  }
  #
  if(class(dev.list()) != "NULL"){dev.off()}
  #
  vplayout <- function(x,y){viewport(layout.pos.row=x, layout.pos.col=y)}
  #
  for(j in 1:nShocks){
    #
    if(save==TRUE){
      if(nShocks==1){
        cairo_ps(file="DSGEBIRFs.eps",height=height,width=width)
      }else{
        SaveIRF <- paste(varnames[nResp-nShocks+j],"_Shock",".eps",sep="")
        #
        cairo_ps(file=SaveIRF,height=height,width=width)
      }
    }
    grid.newpage()
    pushViewport(viewport(layout=grid.layout(MR,MC)))
    #
    if(nShocks > 1 && ObservableIRFs!=TRUE){
      varnames2 <- varnames[-DropCount[-(j)]]
    }else{varnames2 <- varnames}
    #
    IRFCount <- 1
    IRFO <- 1
    if(ObservableIRFs==TRUE){IRFO <- nResp}
    #
    for(i in 1:MR){
      for(k in 1:MC){
        #
        if(IRFCount <= (nResp - nShocks + IRFO)){
          IRFDF <- data.frame(IRFPlot[,,IRFCount,j])
          colnames(IRFDF) <- c("IRFL","IRFM","IRFU","Time")
          #
          #print(ggplot(data=(IRFDF),aes(x=Time)) + xlab("Horizon") + ylab(paste(varnames2[IRFCount])) + geom_hline(yintercept=0) + geom_line(aes(y=IRFM),color="purple",size=2),vp = vplayout(i,k))
          print(ggplot(data=(IRFDF),aes(x=Time)) + xlab("Horizon") + ylab(paste(varnames2[IRFCount])) + geom_ribbon(aes(ymin=IRFL,ymax=IRFU),color="blue",lty=1,fill="blue",alpha=0.2,size=0.1) + geom_hline(yintercept=0) + geom_line(aes(y=IRFM),color="purple",size=2),vp = vplayout(i,k))
          #
          IRFCount <- IRFCount + 1
          #
          Sys.sleep(0.6)
        }else{IRFCount <- IRFCount + 1}
      }
    }
    if(save==TRUE){dev.off()}
  }
  #
  return=list(IRFs=IRFsRet)
}

.irfdsgevar <- function(obj,varnames=NULL,percentiles=c(.05,.50,.95),save=TRUE,height=13,width=13){
  #
  if(nrow(obj$Parameters)==0){
    stop("no MCMC draws detected.\n",call.=FALSE)
  }
  #
  ObservableIRFs <- TRUE
  #
  IRFDs <- round(obj$DSGEIRFs,10)
  irf.periods <- as.numeric(dim(IRFDs)[1])
  nResp <- as.numeric(dim(IRFDs)[2])
  nShocks <- as.numeric(dim(IRFDs)[3])
  keep <- dim(IRFDs)[4]
  #
  ObserveMat <- obj$ObserveMat
  #
  IRFObservable <- array(0,dim=c(irf.periods,ncol(ObserveMat),nShocks,keep))
  if(ObservableIRFs == TRUE){
    if(ncol(ObserveMat)==1){
      for(i in 1:keep){
        for(j in 1:nShocks){
          IRFObservable[,1,j,i] <- IRFDs[,,j,i]%*%ObserveMat
        }
      }
    }else{
      for(i in 1:keep){
        for(j in 1:nShocks){
          IRFObservable[,,j,i] <- IRFDs[,,j,i]%*%ObserveMat
        }
      }
    }
    IRFDs <- IRFObservable
    nResp <- as.numeric(ncol(ObserveMat))
  }
  #
  ImpSorted<-aperm(IRFDs,c(2,3,1,4))
  #
  IRFDs<-apply(ImpSorted,c(3,1,2),sort)
  #
  IRFDVs <-aperm(obj$DSGEVARIRFs,c(4,1,2,3))
  #
  IRFUpper <- round(percentiles[3]*keep)
  IRFMid <- round(percentiles[2]*keep)
  IRFLower <- round(percentiles[1]*keep)
  #
  IRFDPlot <- array(NA,dim=c(irf.periods,4,nResp,nShocks))
  IRFDVPlot <- array(NA,dim=c(irf.periods,4,nResp,nShocks))
  for(i in 1:nShocks){
    for(k in 1:nResp){
      IRFPData <- data.frame(c(IRFDs[IRFLower,,k,i]),c(IRFDs[IRFMid,,k,i]),c(IRFDs[IRFUpper,,k,i]),1:(irf.periods))
      IRFPData <- as.matrix(IRFPData)
      IRFDPlot[,,k,i] <- IRFPData
      #
      IRFPData <- data.frame(c(IRFDVs[IRFLower,,k,i]),c(IRFDVs[IRFMid,,k,i]),c(IRFDVs[IRFUpper,,k,i]),1:(irf.periods))
      IRFPData <- as.matrix(IRFPData)
      IRFDVPlot[,,k,i] <- IRFPData
    }
  }
  #
  IRFsRet <- IRFDPlot
  #
  if(class(varnames) != "character"){
    varnames <- character(length=nResp)
    for(i in 1:nResp){  
      varnames[i] <- paste("VAR",i,sep="")
    }
  }
  #
  if(nShocks > 1 && ObservableIRFs!=TRUE){
    IRFDPlot <- array(0,dim=c(irf.periods,4,nResp-nShocks+1,nShocks))
    DropCount <- (nResp-nShocks+1):nResp
    for(j in 1:nShocks){
      IRFDPlot[,,,j] <- IRFsRet[,,-DropCount[-(j)],j]
    }
  }
  #
  MR <- 0; MC <- 0
  if(nResp < 4){
    MR <- nResp; MC <- 1
  }else if(nResp == 4){
    MR <- 2; MC <-2
  }else if(nResp > 4 && nResp < 7){
    MR <- 3; MC <- 2
  }else if(nResp > 6 && nResp < 10){
    MR <- 3; MC <- 3
  }else if(nResp > 9 && nResp < 13){
    MR <- 4; MC <- 3
  }else if(nResp > 12 && nResp < 17){
    MR <- 4; MC <- 4
  }
  #
  if(class(dev.list()) != "NULL"){dev.off()}
  #
  vplayout <- function(x,y){viewport(layout.pos.row=x, layout.pos.col=y)}
  #
  for(j in 1:nShocks){
    #
    if(save==TRUE){
      if(nShocks==1){
        cairo_ps(file="DSGEBIRFs.eps",height=height,width=width)
      }else{
        SaveIRF <- paste(varnames[nResp-nShocks+j],"_Shock",".eps",sep="")
        #
        cairo_ps(file=SaveIRF,height=height,width=width)
      }
    }
    grid.newpage()
    pushViewport(viewport(layout=grid.layout(MR,MC)))
    #
    if(nShocks > 1 && ObservableIRFs!=TRUE){
      varnames2 <- varnames[-DropCount[-(j)]]
    }else{varnames2 <- varnames}
    #
    IRFCount <- 1
    IRFO <- 1
    if(ObservableIRFs==TRUE){IRFO <- nResp}
    #
    for(i in 1:MR){
      for(k in 1:MC){
        #
        if(IRFCount <= (nResp - nShocks + IRFO)){
          IRFDF <- data.frame(IRFDVPlot[,1:3,IRFCount,j],IRFDPlot[,,IRFCount,j])
          colnames(IRFDF) <- c("VARIRFL","VARIRFM","VARIRFU","IRFL","IRFM","IRFU","Time")
          #
          print(ggplot(data=(IRFDF),aes(x=Time)) + xlab("Horizon") + ylab(paste(varnames2[IRFCount])) + geom_ribbon(aes(ymin=IRFL,ymax=IRFU),color="blue",lty=1,fill="blue",alpha=0.2,size=0.1) + geom_hline(yintercept=0) + geom_line(aes(y=IRFM),color="purple",size=2) + geom_line(aes(y=VARIRFM),color="darkgreen",size=2) + geom_line(aes(y=VARIRFL),color="darkgreen",size=1,linetype=4) + geom_line(aes(y=VARIRFU),color="darkgreen",size=1,linetype=4),vp = vplayout(i,k))
          #
          IRFCount <- IRFCount + 1
          #
          Sys.sleep(0.6)
        }else{IRFCount <- IRFCount + 1}
      }
    }
    if(save==TRUE){dev.off()}
  }
  #
  return=list(IRFs=IRFsRet)
}
br_crssLayout <- function(plist,inSeed,nRep,pGroup = NULL){
  crssReps <- vector("list",length(nRep))
  br_layout <- data.frame(NA)
  layList <- vector("list",)
  for(i in 1:nRep){
    set.seed(inSeed+i)
    if(i%%2 == 0){
      crssReps[[i]] <- c(
        sample(plist,length(plist)),sample(pGroup,length(pGroup))
      )
    } else {
      crssReps[[i]] <- c(
        sample(pGroup,length(pGroup)),sample(plist,length(plist))
      )
    }
    br_layout <- cbind(br_layout,crssReps[[i]])
    colnames(br_layout)[-1] <- paste0("REP",1:nRep)
    br_layout[1] <- row.names(br_layout)
    colnames(br_layout)[1] <- "plot"
  }
  br_layout
}

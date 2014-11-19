
-----------------------------------prepare library and data------------------------------------
library(quantmod)
library(data.table)
library(reshape2)
  trade=setRefClass("trade",
                    fields=list(date="Date",trade_stt="character",trade_action_check="character",result="data.frame"),
                    methods=list(check_=function(check,new_date)
                    {if (trade_stt==check|| as.numeric(new_date-date)<5) {trade_stt <<-trade_stt} else 
                    {if (check=="Buy") {trade_stt <<- "Buy"
                                        date <<-new_date; result <<-rbind(result,data.frame(date=new_date,stt="Buy")) } else {trade_stt <<- "Sell";date <<- new_date;result <<-rbind(result,data.frame(date=new_date,stt="Sell"))
                                        }}}
                    )
  )





#---------------------begin-------------------------------------------------
  trade=setRefClass("trade",
                    fields=list(date="Date",trade_stt="character",trade_action_check="character",result="data.frame"),
                    methods=list(check_=function(check,new_date)
                    {if (trade_stt==check|| as.numeric(new_date-date)<5) {trade_stt <<-trade_stt} else 
                    {if (check=="Buy") {trade_stt <<- "Buy"
                                        date <<-new_date; result <<-rbind(result,data.frame(date=new_date,stt="Buy")) } else {trade_stt <<- "Sell";date <<- new_date;result <<-rbind(result,data.frame(date=new_date,stt="Sell"))
                                        }}}
                    )
  )

#--------------------------------------------------------------------
bt=function(ticker){
X=ticker
a=trade(date=as.Date('2000-01-01'),trade_stt="NA")
nrow1=nrow(X)
names(X)[6]='Adj.Close'
X_C=X[,6]
date1=as.Date(index(X),f='%Y-%m-%d')
X_C=as.data.frame(X_C)
X_C=data.table(X_C)
X_C[,SMA20:=SMA(Adj.Close,50)]
X_C[,check:=ifelse(Adj.Close>SMA20,"Buy","Sell")]
X_C
X_C$date=date1
X_C
X_C$date=as.Date(X_C$date)
lapply(51:nrow1,function(x){a$check_(new_date=X_C$date[x],check=X_C$check[x])})
result=a$result
result =merge(x=result,y=X_C,by='date')
result$lag1=lag(result$Adj.Close,1)
result$return=result$Adj.Close/result$lag1-1
result.final=subset(result,check=="Sell")
b=result.final$return; b[is.na(b)]=0
cum1=cumprod(1+b)
print(result)
print(cum1)
return(result.final)}
#----------------------------------------------------------------------

ED_C=ED[,6]
ED_C=as.data.frame(ED_C)
ED_C=data.table(ED_C)
ED_C[,SMA20:=SMA(ED.Adjusted,20)]
ED_C[,check:=ifelse(ED.Adjusted>SMA20,"Buy","Sell")]
ED_C
ED_C$date=date1
ED_C
ED_C$date=as.Date(ED_C$date)
lapply(21:1833,function(x){a$check_(new_date=ED_C$date[x],check=ED_C$check[x])})

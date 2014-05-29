
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

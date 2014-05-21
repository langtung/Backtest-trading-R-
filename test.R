
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

